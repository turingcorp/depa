#import "analytics.h"

#define keyUserName @"username"
#define valueUserName @"default"
#define keyScreen @"screen"

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
    Mofiler *mofiler = [Mofiler sharedInstance];
    [mofiler initializeWithAppKey:analyticsKey appName:analyticsId identity:@{keyUserName:valueUserName}];
    mofiler.delegate = self;
    mofiler.useLocation = false;
    mofiler.url = @"mofiler.com";
//    mofiler.useVerboseContext = true;
}

-(void)trackscreen:(ga_screen)screen
{
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       [[Mofiler sharedInstance] injectValueWithNewValue:@{keyScreen:screens[screen]} expirationDateInMilliseconds:nil];
                       [[Mofiler sharedInstance] flushDataToMofiler];
                   });
}

-(void)trackevent:(ga_event)event action:(ga_action)action label:(NSString*)label
{
    NSString *eventname = events[event];
    NSString *eventaction = actions[action];
    NSString *eventAction = [NSString stringWithFormat:@"%@/%@", eventname, eventaction];
    
    dispatch_async(dispatch_get_main_queue(),
    ^{
        [[Mofiler sharedInstance] injectValueWithNewValue:@{eventAction:label} expirationDateInMilliseconds:nil];
        [[Mofiler sharedInstance] flushDataToMofiler];
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
    
#endif
    
}

@end
