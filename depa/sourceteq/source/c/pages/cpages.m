#import "cpages.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.itemplay = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionplay:)];
    self.itemplay.tag = UIPageViewControllerNavigationDirectionForward;
    self.itemconfig = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionconfig:)];
    self.itemfavorites = [[UIBarButtonItem  alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(actionfavorites:)];
    
    [self.navigationItem setRightBarButtonItem:self.itemfavorites];
    [self.navigationItem setLeftBarButtonItem:self.itemconfig];
    [self showplay:UIPageViewControllerNavigationDirectionForward animated:NO];
    
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
    [self changecontroller:[[cplayload alloc] init] direction:direction animated:animated];
}

-(void)showconfig:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    self.itemplay.tag = UIPageViewControllerNavigationDirectionForward;
    [self changecontroller:[[UIViewController alloc] init] direction:direction animated:animated];
}

-(void)showfavorites:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    self.itemplay.tag = UIPageViewControllerNavigationDirectionReverse;
    [self changecontroller:[[UIViewController alloc] init] direction:direction animated:animated];
}

@end