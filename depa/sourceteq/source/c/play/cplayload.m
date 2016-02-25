#import "cplayload.h"

@implementation cplayload

-(instancetype)init:(cplay*)play
{
    self = [super init];
    
    self.play = play;
    
    return self;
}

-(void)dealloc
{
    [self.callmanager cancelcall];
}

-(void)loadView
{
    self.view = [[vplayload alloc] init:self];
    self.viewload = (vplayload*)self.view;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self recall];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self stopcall];
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)stopcall
{
    [self.callmanager cancelcall];
    [self.viewload showretry];
    self.play.model.busy = NO;
}

#pragma mark public

-(void)recall
{
    [self.viewload showloading];
    
    if(self.play.model)
    {
        if(!self.play.model.busy)
        {
            self.play.model.busy = YES;
            amanager *callmanager = [amanager call:[[acallsearch alloc] init:[self.play.model variables]] delegate:self];
            self.callmanager = callmanager;
        }
    }
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    [self.play.model join:(aparsersearch*)manager.call.parser];
    self.play.model.busy = NO;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.play playno];
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    [valert alert:error inview:self.viewload];
    NSLog(@"Error: %@", error);

    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self stopcall];
                   });
}

@end