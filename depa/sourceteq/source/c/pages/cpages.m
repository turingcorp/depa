#import "cpages.h"

@implementation cpages

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

-(void)actionplayleft:(UIBarButtonItem*)item
{
    [self showplay:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

-(void)actionplayright:(UIBarButtonItem*)item
{
    [self showplay:UIPageViewControllerNavigationDirectionForward animated:YES];
}

-(void)actionconfig:(UIBarButtonItem*)item
{
    [self showconfig:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

-(void)actionfavorites:(UIBarButtonItem*)item
{
    [self showfavorites:UIPageViewControllerNavigationDirectionForward animated:YES];
}

#pragma mark functionality

-(void)showplay:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    
}

-(void)showconfig:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    
}

-(void)showfavorites:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    
}

@end