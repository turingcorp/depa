#import "appdel.h"

@implementation appdel
{
    UIWindow *window;
}

-(BOOL)application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options
{
    [updater launch];
    
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    [window setBackgroundColor:[UIColor whiteColor]];
    [window setRootViewController:[cmain singleton]];
    
    return YES;
}

-(void)applicationWillEnterForeground:(UIApplication*)application
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger ttl = [[defaults valueForKey:@"ttl"] integerValue];
    
    if(ttl == 2)
    {
        ttl = 0;
    }
    else
    {
        ttl++;
    }
    
    [defaults setValue:@(ttl) forKey:@"ttl"];
}

@end
