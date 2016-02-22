#import "cplay.h"

static const NSUInteger minitemspull = 3;

@implementation cplay

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.model = [[msearch alloc] init:[[msearchtypeflat alloc] init] mode:[[msearchmoderent alloc] init]];
    [self changecontroller:[[cplayload alloc] init:self] direction:UIPageViewControllerNavigationDirectionForward animated:YES];
    
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
    self.current = controller;
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

-(void)shownextitem:(UIPageViewControllerNavigationDirection)direction
{
    msearchresult *item = [self.model next];
    UIViewController *controller;
    
    if(item)
    {
        controller = [[cplayitem alloc] init:self item:item];
    }
    else
    {
        if(self.model.offset < self.model.total)
        {
            controller = [[cplayload alloc] init:self];
        }
        else
        {
            controller = [[cplayempty alloc] init];
        }
    }
    
    [self changecontroller:controller direction:direction animated:YES];
    [self backgroundpull];
}

-(void)backgroundpull
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       if([self.model count] < minitemspull)
                       {
                           if(!self.model.busy)
                           {
                               self.model.busy = YES;
                               amanager *callmanager = [amanager call:apicall_search delegate:self valriables:[self.model variables]];
                               self.callmanager = callmanager;
                           }
                       }
                   });
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