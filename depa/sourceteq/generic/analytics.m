#import "analytics.h"

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
    
    Mofiler *mofiler = [Mofiler sharedInstance];
    [mofiler initializeWithAppKey:analyticsKey appName:analyticsId identity:identity];
    mofiler.delegate = self;
    mofiler.useLocation = false;
//    mofiler.url = @"mofiler.com";
    mofiler.useVerboseContext = true;
}

-(void)trackscreen:(ga_screen)screen
{
    NSMutableDictionary *screenEvent = [NSMutableDictionary dictionary];
    screenEvent[kKeyScreen] = screens[screen];
    
    [[Mofiler sharedInstance] injectValueWithNewValue:screenEvent expirationDateInMilliseconds:nil];
    [[Mofiler sharedInstance] flushDataToMofiler];
}

-(void)trackevent:(ga_event)event action:(ga_action)action label:(NSString*)label
{
    NSString *eventname = events[event];
    NSString *eventaction = actions[action];
    NSString *eventNameAction = [NSString stringWithFormat:@"%@.%@", eventname, eventaction];
    
    NSMutableDictionary *actionEvent = [NSMutableDictionary dictionary];
    actionEvent[eventNameAction] = label;
    
    [[Mofiler sharedInstance] injectValueWithNewValue:actionEvent expirationDateInMilliseconds:nil];
    [[Mofiler sharedInstance] flushDataToMofiler];
    
    [[Mofiler sharedInstance] getValueWithKey:eventNameAction identityKey:kKeyUsername identityValue:kValueUsername callback:^(id resutl, id error) {
        NSLog(@"%@, error: %@", resutl, error);
    }];
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
    
#endif
    
}

@end
