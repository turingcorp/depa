#import "analytics.h"

NSString *const analyticsId = @"DEPA";
NSString *const analyticsKey = @"DEPA";
NSString *const kKeyUsername = @"username";
NSString *const kKeyScreen = @"screen";
NSString *const kMofilerUrl = @"modefiler.com";

@implementation analytics
{
    NSMutableDictionary *tracked;
    NSArray *screens;
    NSArray *events;
    NSArray *actions;
    NSString *userName;
}

+(instancetype)singleton
{
    static analytics *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    tracked = [NSMutableDictionary dictionary];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"analytics" withExtension:@"plist"]];
    screens = plist[@"screens"];
    events = plist[@"events"];
    actions = plist[@"actions"];
    userName = [NSUUID UUID].UUIDString;
    
    return self;
}

#pragma mark private



#pragma mark public

-(void)start
{
    NSMutableDictionary *identity = [NSMutableDictionary dictionary];
    identity[kKeyUsername] = userName;
    
    self.mofiler = [Mofiler sharedInstance];
    [self.mofiler initializeWithAppKey:analyticsKey appName:analyticsId useAdvertisingId:true];
    [self.mofiler addIdentityWithIdentity:identity];
    self.mofiler.delegate = self;
    self.mofiler.url = kMofilerUrl;
    self.mofiler.useLocation = true;
    self.mofiler.useVerboseContext = false;
    self.mofiler.debugLogging = false;
    [self.mofiler flushDataToMofiler];
}

-(void)trackscreen:(ga_screen)screen
{
    NSString *screenName = [NSString stringWithFormat:@"%@%@",
                            kKeyScreen,
                            screens[screen]];
    NSNumber *trackCounter = tracked[screenName];
    
    if (trackCounter == nil)
    {
        trackCounter = @1;
    }
    else
    {
        trackCounter = @(trackCounter.integerValue + 1);
    }
    
    NSMutableDictionary *screenEvent = [NSMutableDictionary dictionary];
    screenEvent[screenName] = [NSString stringWithFormat:@"%@",
                               trackCounter];
    tracked[screenName] = trackCounter;
    
    [self.mofiler injectValueWithNewValue:screenEvent expirationDateInMilliseconds:nil];
    [self.mofiler flushDataToMofiler];
}

-(void)trackevent:(ga_event)event action:(ga_action)action label:(NSString*)label
{
    NSString *eventname = events[event];
    NSString *eventaction = actions[action];
    NSString *eventNameAction = [NSString stringWithFormat:@"%@.%@", eventname, eventaction];
    
    NSMutableDictionary *actionEvent = [NSMutableDictionary dictionary];
    actionEvent[eventNameAction] = label;
    
    [self.mofiler injectValueWithNewValue:actionEvent expirationDateInMilliseconds:nil];
    [self.mofiler flushDataToMofiler];
}

#pragma mark -
#pragma mark mofiler del

-(void)responseValueWithKey:(NSString *)key identityKey:(NSString *)identityKey identityValue:(NSString *)identityValue value:(NSDictionary<NSString *,id> *)value
{
    
#if DEBUG
    
    NSLog(@"analytics response: %@", value);
    
#endif
    
}

-(void)errorOcurredWithError:(NSString *)error userInfo:(NSDictionary<NSString *,NSString *> *)userInfo
{
    
#if DEBUG
    
    NSLog(@"analytics error: %@", error);
    NSLog(@"%@", userInfo);
    
#endif
    
}

@end
