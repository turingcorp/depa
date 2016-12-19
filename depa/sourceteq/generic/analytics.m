#import "analytics.h"

NSString *const analyticsId = @"DEPA";
NSString *const analyticsKey = @"DEPA";
NSString *const kKeyUsername = @"username";
NSString *const kValueUsername = @"default";
NSString *const kKeyScreen = @"screen";

@implementation analytics
{
    NSArray *screens;
    NSArray *events;
    NSArray *actions;
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
    
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"analytics" withExtension:@"plist"]];
    screens = plist[@"screens"];
    events = plist[@"events"];
    actions = plist[@"actions"];
    
    return self;
}

#pragma mark public

-(void)start
{
    NSMutableDictionary *identity = [NSMutableDictionary dictionary];
    identity[kKeyUsername] = kValueUsername;
    
    self.mofiler = [Mofiler sharedInstance];
    self.mofiler.delegate = self;
    [self.mofiler initializeWithAppKey:analyticsKey appName:analyticsId identity:identity];
    self.mofiler.url = @"mofiler.com";
    self.mofiler.useLocation = true;
    [self.mofiler addIdentityWithIdentity:@{@"name":@"default"}];
    [self.mofiler addIdentityWithIdentity:@{@"email":@"default@mail.com"}];
    self.mofiler.useVerboseContext = false;
    self.mofiler.debugLogging = false;
    
    NSLog(@"debug %@", @(self.mofiler.debugLogging));
}

-(void)trackscreen:(ga_screen)screen
{
    NSMutableDictionary *screenEvent = [NSMutableDictionary dictionary];
    screenEvent[kKeyScreen] = screens[screen];
    
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
    [self.mofiler injectValueWithNewValue:@{@"test":@"{\"value\":\"test\"}"} expirationDateInMilliseconds:nil];
    [self.mofiler flushDataToMofiler];
    
    [self.mofiler getValueWithKey:@"test" identityKey:kKeyUsername identityValue:kValueUsername];
}

#pragma mark -
#pragma mark mofiler del

-(void)responseValueWithKey:(NSString *)key identityKey:(NSString *)identityKey identityValue:(NSString *)identityValue value:(NSDictionary<NSString *,id> *)value
{
    
#if DEBUG
    
    NSLog(@"analytics response: %@:%@", key, value);
    
#endif
    
}

-(void)errorOcurredWithError:(NSString *)error userInfo:(NSDictionary<NSString *,NSString *> *)userInfo
{
    
#if DEBUG
    
    NSLog(@"analytics error: %@", error);
    
#endif
    
}

@end
