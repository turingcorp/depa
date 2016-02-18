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

-(void)recall
{
    amanager *callmanager = [amanager call:apicall_search delegate:self valriables:[self.play.model variables]];
    self.callmanager = callmanager;
}

-(void)stopcall
{
    [self.callmanager cancelcall];
    [self.viewload showretry];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    [valert alert:error inview:self.viewload];

    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self stopcall];
                   });
}

@end