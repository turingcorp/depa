#import "analytics.h"

@implementation analytics

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
