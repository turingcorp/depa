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
    NSMutableDictionary *identity = [NSMutableDictionary dictionary];
    identity[kKeyUsername] = kValueUsername;
    identity[@"name"] = @"juan";
    identity[@"email"] = @"juan@mail.com";
    
    self.mofiler = [Mofiler sharedInstance];
    [self.mofiler initializeWithAppKey:analyticsKey appName:analyticsId identity:identity];
    self.mofiler.delegate = self;
    self.mofiler.url = @"mofiler.com";
    self.mofiler.useLocation = false;
    self.mofiler.useVerboseContext = true;
    self.mofiler.debugLogging = true;
    
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
    
//    [self.mofiler injectValueWithNewValue:actionEvent expirationDateInMilliseconds:nil];
    
    [self.mofiler injectValueWithNewValue:@{@"key1":@"value1"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key2":@"value2"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key3":@"value3"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key4":@"value4"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key5":@"value5"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key6":@"value6"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key7":@"value7"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key8":@"value8"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key9":@"value9"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key10":@"value10"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key11":@"value11"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key12":@"value12"} expirationDateInMilliseconds:nil];
    [self.mofiler injectValueWithNewValue:@{@"key13":@"value13"} expirationDateInMilliseconds:nil];
    [self.mofiler flushDataToMofiler];
    
    [self.mofiler getValueWithKey:@"key1" identityKey:kKeyUsername identityValue:kValueUsername callback:
     ^(id result, id error)
     {
         NSLog(@"%@", result);
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
    NSLog(@"%@", userInfo);
    
#endif
    
}

@end
