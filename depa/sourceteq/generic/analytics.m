#import "analytics.h"

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
    [mofiler initializeWithAppKey:analyticsKey appName:analyticsId identity:@{@"username":@"anonymous"}];
    mofiler.delegate = self;
    mofiler.useLocation = true;
    mofiler.url = @"mofiler.com";
    mofiler.useVerboseContext = true;

}

-(void)trackscreen:(ga_screen)screen
{
    [[Mofiler sharedInstance] injectValueWithNewValue:@{@"screen":screens[screen]} expirationDateInMilliseconds:nil];
    [[Mofiler sharedInstance] flushDataToMofiler];
}

-(void)trackevent:(ga_event)event action:(ga_action)action label:(NSString*)label
{
    NSString *eventname = events[event];
    NSString *eventaction = actions[action];
    [[Mofiler sharedInstance] injectValueWithNewValue:@{eventname:eventaction} expirationDateInMilliseconds:nil];
    [[Mofiler sharedInstance] flushDataToMofiler];
}

#pragma mark -
#pragma mark mofiler del

-(void)responseValueWithKey:(NSString *)key identityKey:(NSString *)identityKey identityValue:(NSString *)identityValue value:(NSDictionary<NSString *,id> *)value
{
    NSLog(@"%@", value);
}

-(void)errorOcurredWithError:(NSString *)error userInfo:(NSDictionary<NSString *,NSString *> *)userInfo
{
    NSLog(@"%@", error);
}

@end
