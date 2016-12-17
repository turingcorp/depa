#import "analytics.h"

static NSUInteger const analyticsdispatch = 10;

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
    mofiler.useLocation = false;
    
    
//    self.tracker = [[GAI sharedInstance] trackerWithTrackingId:analyticsid];
//    [[GAI sharedInstance] setTrackUncaughtExceptions:YES];
//    [[GAI sharedInstance] setDispatchInterval:analyticsdispatch];
//    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelNone];
//    
//#if DEBUG
//    
//    [[GAI sharedInstance] setDryRun:YES];
//    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];
//    
//#endif
//    
}

-(void)trackscreen:(ga_screen)screen
{
//    [self.tracker send:[[[GAIDictionaryBuilder createScreenView] set:screens[screen] forKey:kGAIScreenName] build]];
}

-(void)trackevent:(ga_event)event action:(ga_action)action label:(NSString*)label
{
//    NSString *eventname = events[event];
//    NSString *eventaction = actions[action];
//    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:eventname action:eventaction label:label value:@(1)] build]];
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
