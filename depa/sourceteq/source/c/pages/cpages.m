#import "cpages.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.itemplay = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"play"] style:UIBarButtonItemStylePlain target:self action:@selector(actionplay:)];
    self.itemplay.tag = UIPageViewControllerNavigationDirectionForward;
    self.itemconfig = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filter"] style:UIBarButtonItemStylePlain target:self action:@selector(actionconfig:)];
    self.itemfavorites = [[UIBarButtonItem  alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(actionfavorites:)];
    
    [self showplay:UIPageViewControllerNavigationDirectionForward animated:NO];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
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

-(void)actionplay:(UIBarButtonItem*)item
{
    [self showplay:item.tag animated:YES];
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

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

-(void)showplay:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    [self setTitle:NSLocalizedString(@"app_title", nil)];
    
    [self changecontroller:[[cplay alloc] init] direction:direction animated:animated];
    [self.navigationItem setRightBarButtonItem:self.itemfavorites];
    [self.navigationItem setLeftBarButtonItem:self.itemconfig];
}

-(void)showconfig:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    [self setTitle:NSLocalizedString(@"config_title", nil)];
    
    self.itemplay.tag = UIPageViewControllerNavigationDirectionForward;
    [self changecontroller:[[cconfig alloc] init] direction:direction animated:animated];
    [self.navigationItem setRightBarButtonItem:self.itemplay];
    [self.navigationItem setLeftBarButtonItem:nil];
}

-(void)showfavorites:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    [self setTitle:NSLocalizedString(@"favorites_title", nil)];
    
    self.itemplay.tag = UIPageViewControllerNavigationDirectionReverse;
    [self changecontroller:[[UIViewController alloc] init] direction:direction animated:animated];
    [self.navigationItem setRightBarButtonItem:nil];
    [self.navigationItem setLeftBarButtonItem:self.itemplay];
}

@end