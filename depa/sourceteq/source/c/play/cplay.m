#import "cplay.h"

static const NSUInteger minitemspull = 3;

@implementation cplay

-(instancetype)init:(BOOL)synch
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    if(synch)
    {
        self.model = [[msearch alloc] init];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifieditemsloaded:) name:notitemsloaded object:nil];
    }
    
    [self changecontroller:[[cplayload alloc] init:self] direction:UIPageViewControllerNavigationDirectionForward animated:YES];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self stopcall];
}

#pragma mark notified

-(void)notifieditemsloaded:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    self.model = [[msearch alloc] init];
    
    if([self.current isKindOfClass:[cplayload class]])
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [(cplayload*)self.current recall];
                       });
    }
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
                               amanager *callmanager = [amanager call:[[acallsearch alloc] init:[self.model variables]] delegate:self];
                               self.callmanager = callmanager;
                           }
                       }
                   });
}

-(void)stopcall
{
    [self.callmanager cancelcall];
    self.model.busy = NO;
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

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    [self.model join:(aparsersearch*)manager.call.parser];
    
    if([self.current isKindOfClass:[cplayload class]])
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self shownextitem:UIPageViewControllerNavigationDirectionForward];
                       });
    }
    
    self.model.busy = NO;
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    NSLog(@"Error: %@", error);
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self stopcall];
                   });
}

@end