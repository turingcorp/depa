#import "cpages.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.itemplay = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"play"] style:UIBarButtonItemStylePlain target:self action:@selector(actionplay:)];
    self.itemplay.tag = UIPageViewControllerNavigationDirectionForward;
    self.itemconfig = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filter"] style:UIBarButtonItemStylePlain target:self action:@selector(actionconfig:)];
    self.itemconfig.imageInsets = UIEdgeInsetsMake(0, -14, 0, 0);
    self.itemfavorites = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"liked"] style:UIBarButtonItemStylePlain target:self action:@selector(actionfavorites:)];
    self.itemfavorites.imageInsets = UIEdgeInsetsMake(0, -14, 0, 14);
    
    UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [titleview setUserInteractionEnabled:NO];
    [titleview setClipsToBounds:YES];
    [titleview setContentMode:UIViewContentModeScaleAspectFit];
    [titleview setTintColor:[UIColor whiteColor]];
    [self.navigationItem setTitleView:titleview];
    self.titleview = titleview;
    [self showplay:UIPageViewControllerNavigationDirectionForward animated:NO sync:NO];
    
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
    [self showplay:item.tag animated:YES sync:YES];
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

-(void)showplay:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated sync:(BOOL)sync
{
    [self.titleview setImage:[[UIImage imageNamed:@"play"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    [self changecontroller:[[cplay alloc] init:sync] direction:direction animated:animated];
    [self.navigationItem setRightBarButtonItem:self.itemfavorites];
    [self.navigationItem setLeftBarButtonItem:self.itemconfig];
}

-(void)showconfig:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    [self.titleview setImage:[[UIImage imageNamed:@"filter"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    self.itemplay.tag = UIPageViewControllerNavigationDirectionForward;
    self.itemplay.imageInsets = UIEdgeInsetsMake(0, -14, 0, 14);
    [self changecontroller:[[cconfig alloc] init] direction:direction animated:animated];
    [self.navigationItem setRightBarButtonItem:self.itemplay];
    [self.navigationItem setLeftBarButtonItem:nil];
}

-(void)showfavorites:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    [self.titleview setImage:[[UIImage imageNamed:@"liked"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    self.itemplay.tag = UIPageViewControllerNavigationDirectionReverse;
    self.itemplay.imageInsets = UIEdgeInsetsMake(0, -14, 0, 0);
    [self changecontroller:[[cliked alloc] init] direction:direction animated:animated];
    [self.navigationItem setRightBarButtonItem:nil];
    [self.navigationItem setLeftBarButtonItem:self.itemplay];
}

#pragma mark public

-(void)openconfig
{
    [self actionconfig:nil];
}

@end