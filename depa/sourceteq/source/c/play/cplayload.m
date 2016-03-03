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

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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

-(void)inrecall
{
    amanager *callmanager = [amanager call:[[acallsearch alloc] init:[self.play.model variables]] delegate:self];
    self.callmanager = callmanager;
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
            [self inrecall];
        }
    }
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    aparsersearch *parser = (aparsersearch*)manager.call.parser;
    [self.play.model stats:parser];
    
    if(parser.pullagain && self.play.model.offset < self.play.model.total)
    {
        [self inrecall];
    }
    else
    {
        [self.play.model join:parser];
        self.play.model.busy = NO;
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.play playitem];
                       });
    }
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    [valert alert:error inview:self.viewload offsettop:0];
    //NSLog(@"Error: %@", error);

    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self stopcall];
                   });
}

@end