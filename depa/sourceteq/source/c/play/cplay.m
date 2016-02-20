#import "cplay.h"

@implementation cplay

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.model = [[msearch alloc] init:[[msearchtypeflat alloc] init]];
    [self showloading:NO];
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

-(void)showloading:(BOOL)animated
{
    [self changecontroller:[[cplayload alloc] init:self] direction:UIPageViewControllerNavigationDirectionForward animated:animated];
}

-(void)shownextitem:(UIPageViewControllerNavigationDirection)direction
{
    [self changecontroller:[[cplayitem alloc] init:self] direction:direction animated:YES];
}

#pragma mark public

-(void)playlike
{
    [self shownextitem:UIPageViewControllerNavigationDirectionReverse];
}

-(void)playno
{
    [self shownextitem:UIPageViewControllerNavigationDirectionForward];
}

@end