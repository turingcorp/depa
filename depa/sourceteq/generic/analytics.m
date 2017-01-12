#import "analytics.h"

NSString *const analyticsId = @"DEPA";
NSString *const analyticsKey = @"DEPA";
NSString *const kKeyUsername = @"username";
NSString *const kValueUsername = @"juan";
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
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       NSMutableDictionary *identity = [NSMutableDictionary dictionary];
                       identity[@"user"] = kValueUsername;
                       
                       self.mofiler = [Mofiler sharedInstance];
                       [self.mofiler initializeWithAppKey:analyticsKey appName:analyticsId useAdvertisingId:true];
                       [self.mofiler addIdentityWithIdentity:@{@"user":@"juan"}];
                       [self.mofiler addIdentityWithIdentity:@{@"name":@"juan"}];
                       [self.mofiler addIdentityWithIdentity:@{@"username":@"juan"}];
                       [self.mofiler addIdentityWithIdentity:@{@"email":@"juan@juan.com"}];
                       self.mofiler.delegate = self;
                       self.mofiler.url = @"mofiler.com";
                       self.mofiler.useLocation = false;
                       self.mofiler.useVerboseContext = true;
                       self.mofiler.debugLogging = true;
                       [self.mofiler flushDataToMofiler];
                   });
    
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
    
    
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.mofiler injectValueWithNewValue:@{@"mykey1":@"a123"} expirationDateInMilliseconds:nil];
                       [self.mofiler flushDataToMofiler];
                   });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mofiler getValueWithKey:@"mykey1" identityKey:@"name" identityValue:kValueUsername callback:
         ^(id result, id error)
         {
             NSLog(@"%@", result);
         }];
        
        [self.mofiler getValueWithKey:@"mykey1" identityKey:@"name" identityValue:kValueUsername callback:
         ^(id result, id error)
         {
             NSLog(@"%@", result);
         }];
        
        [self.mofiler getValueWithKey:@"mykey1" identityKey:@"name" identityValue:kValueUsername callback:
         ^(id result, id error)
         {
             NSLog(@"%@", result);
         }];
        
        [self.mofiler getValueWithKey:@"mykey1" identityKey:@"name" identityValue:kValueUsername callback:
         ^(id result, id error)
         {
             NSLog(@"%@", result);
         }];
        
        [self.mofiler getValueWithKey:@"mykey1" identityKey:@"name" identityValue:kValueUsername callback:
         ^(id result, id error)
         {
             NSLog(@"%@", result);
         }];
        
        [self.mofiler getValueWithKey:@"mykey1" identityKey:@"name" identityValue:kValueUsername callback:
         ^(id result, id error)
         {
             NSLog(@"%@", result);
         }];
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
