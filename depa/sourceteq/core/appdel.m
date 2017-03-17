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

-(void)applicationDidBecomeActive:(UIApplication *)application
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger ttl = [[defaults valueForKey:@"ttl"] integerValue];
    
    if(ttl > 5)
    {
        ttl = 0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 3000), dispatch_get_main_queue(),
                       ^
                       {
                           [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ttl_title", nil) message:NSLocalizedString(@"ttl_message", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ttl_cancel", nil) otherButtonTitles:NSLocalizedString(@"ttl_rate", nil), nil] show];
                       });
    }
    else
    {
        ttl++;
    }
    
    [defaults setValue:@(ttl) forKey:@"ttl"];
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    if(index)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:@(-6) forKey:@"ttl"];
        
        NSURL *url = [NSURL URLWithString:
                      @"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1089721156&type=Purple+Software&mt=8"];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
