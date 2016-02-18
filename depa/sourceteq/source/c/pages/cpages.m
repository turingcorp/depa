#import "cpages.h"

@implementation cpages
{
    NSTimer *timer;
}

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self setViewControllers:@[[[cplay alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    UIBarButtonItem *itemadd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionadd:)];
    self.itemadd = itemadd;
    
    UIBarButtonItem *itemsettings = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings"] style:UIBarButtonItemStylePlain target:self action:@selector(actionconfig:)];
    self.itemsettings = itemsettings;
    
    UIBarButtonItem *itemlistleft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"list"] style:UIBarButtonItemStylePlain target:self action:@selector(actionlistleft:)];
    self.itemlistleft = itemlistleft;
    
    UIBarButtonItem *itemlistright = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"list"] style:UIBarButtonItemStylePlain target:self action:@selector(actionlistright:)];
    self.itemlistright = itemlistright;
    
    UIBarButtonItem *itemshare = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionshare:)];
    self.itemshare = itemshare;
    
    [self.navigationItem setRightBarButtonItem:itemadd];
    [self.navigationItem setLeftBarButtonItem:itemsettings];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"app_title", nil)];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark actions

-(void)actionadd:(UIBarButtonItem*)item
{
    [self insideaddflow];
}

-(void)actionlistleft:(UIBarButtonItem*)item
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"alert_delete_title", nil) message:NSLocalizedString(@"alert_delete_descr", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"alert_cancel", nil) otherButtonTitles:NSLocalizedString(@"alert_delete_ok", nil), nil] show];
}

-(void)actionlistright:(UIBarButtonItem*)item
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[UIViewController alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemadd];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemsettings];
     }];
}

-(void)actionconfig:(UIBarButtonItem*)item
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[UIViewController alloc] init]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemlistright];
         [weakself.navigationItem setLeftBarButtonItem:nil];
     }];
}

#pragma mark functionality

-(void)insideaddflow
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[UIViewController alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemshare];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemlistleft];
     }];
}

-(void)insideshowlistleft
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[UIViewController alloc] init]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemadd];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemsettings];
     }];
}

#pragma mark public

-(void)addflow
{
    [self insideaddflow];
}

-(void)showlist
{
    [self insideshowlistleft];
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    if(index)
    {
        [self insideshowlistleft];
    }
}

@end