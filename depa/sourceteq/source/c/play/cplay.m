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
    [[analytics singleton] trackscreen:ga_screen_play];
 
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.callmanager cancelcall];
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
    [self.callmanager cancelcall];
}

#pragma mark notified

-(void)notifieditemsloaded:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    self.model = [[msearch alloc] init];
    
    if([self.current isKindOfClass:[cplayload class]])
    {
        __weak typeof(self) weakself = self;
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [(cplayload*)weakself.current recall];
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

-(void)shownextitem:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
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
    
    [self changecontroller:controller direction:direction animated:animated];
    [self backgroundpull];
}

-(void)backgroundpull
{
    __weak typeof(self) weakself = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       if(!weakself.model.busy)
                       {
                           if(weakself.model.items.count < minitemspull && weakself.model.offset < weakself.model.total)
                           {
                               weakself.model.busy = YES;
                               amanager *callmanager = [amanager call:[[acallsearch alloc] init:[weakself.model variables]] delegate:weakself];
                               weakself.callmanager = callmanager;
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
    [self shownextitem:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

-(void)playno
{
    [self shownextitem:UIPageViewControllerNavigationDirectionForward animated:YES];
}

-(void)playitem
{
    [self shownextitem:UIPageViewControllerNavigationDirectionForward animated:NO];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    aparsersearch *parser = (aparsersearch*)manager.call.parser;
    [self.model stats:parser];
    [self.model join:parser];
    
    if([self.current isKindOfClass:[cplayload class]])
    {
        __weak typeof(self) weakself = self;
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [weakself shownextitem:UIPageViewControllerNavigationDirectionForward animated:NO];
                       });
    }
    
    self.model.busy = NO;
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    __weak typeof(self) weakself = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [weakself stopcall];
                   });
}

@end