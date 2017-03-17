#import "analytics.h"

NSString *const analyticsId = @"DEPA";
NSString *const analyticsKey = @"DEPA";
NSString *const kKeyScreen = @"screen";
NSString *const kKeyUserId = @"userId";
NSString *const kMofilerUrl = @"mofiler.com";

@implementation analytics
{
    NSMutableDictionary *tracked;
    NSArray *screens;
    NSArray *events;
    NSArray *actions;
    NSString *userId;
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
    userId = [NSUUID UUID].UUIDString;
    
    return self;
}

#pragma mark private

-(NSString*)countFor:(NSString*)key
{
    NSNumber *trackCounter = tracked[key];
    
    if (trackCounter == nil)
    {
        trackCounter = @1;
    }
    else
    {
        trackCounter = @(trackCounter.integerValue + 1);
    }
    
    tracked[key] = trackCounter;
    
    NSString *counterString = [NSString stringWithFormat:@"%@",
                               trackCounter];
    
    return counterString;
}

-(void)inject:(NSDictionary*)dictionary
{
    [self.mofiler injectValueWithNewValue:dictionary expirationDateInMilliseconds:nil];
    [self.mofiler flushDataToMofiler];
}

#pragma mark public

-(void)start
{
    NSMutableDictionary *identity = [NSMutableDictionary dictionary];
    identity[kKeyUserId] = userId;
    
    self.mofiler = [Mofiler sharedInstance];
    [self.mofiler initializeWithAppKey:analyticsKey appName:analyticsId useLoc:true useAdvertisingId:true];
    [self.mofiler addIdentityWithIdentity:identity];
    self.mofiler.delegate = self;
    self.mofiler.url = kMofilerUrl;
    self.mofiler.useVerboseContext = false;
    self.mofiler.debugLogging = false;
    [self.mofiler flushDataToMofiler];
}

-(void)trackscreen:(ga_screen)screen
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       NSString *screenName = [NSString stringWithFormat:@"%@.%@",
                                               kKeyScreen,
                                               screens[screen]];
                       NSString *countString = [self countFor:screenName];
                       NSDictionary *log = @{screenName:countString};
                       [self inject:log];
                   });
}

-(void)trackevent:(ga_event)event action:(ga_action)action label:(NSString*)label
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       NSString *eventname = events[event];
                       NSString *eventaction = actions[action];
                       NSString *eventNameAction = [NSString stringWithFormat:@"%@.%@",
                                                    eventname,
                                                    eventaction];
                       NSString *countString = [self countFor:eventNameAction];
                       NSDictionary *log = @{eventNameAction:countString};
                       [self inject:log];
                   });
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
