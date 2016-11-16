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
        
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ttl_title", nil) message:NSLocalizedString(@"ttl_message", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"ttl_cancel", nil) otherButtonTitles:NSLocalizedString(@"ttl_rate", nil), nil] show];
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
        NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1089721156&type=Purple+Software&mt=8"];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
