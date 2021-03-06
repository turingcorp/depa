#import "cmain.h"

@implementation cmain
{
    UIStatusBarStyle statusBarStyle;
}

+(instancetype)singleton
{
    static cmain *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    cpages *pages = [[cpages alloc] init];
    self.pages = pages;
    self = [super initWithRootViewController:pages];
    statusBarStyle = UIStatusBarStyleLightContent;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setBackgroundColor:[UIColor whiteColor]];
    [self.navigationBar setBarTintColor:colormain];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontboldname size:16], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontboldname size:16], NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.viewControllers[0] viewDidAppear:animated];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return statusBarStyle;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)statusBarDefault
{
    statusBarStyle = UIStatusBarStyleDefault;
    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)statusBarLight
{
    statusBarStyle = UIStatusBarStyleDefault;
    [self setNeedsStatusBarAppearanceUpdate];
}

@end
