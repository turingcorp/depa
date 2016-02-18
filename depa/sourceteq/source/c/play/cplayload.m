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
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    amanager *callmanager = [amanager call:apicall_search delegate:self valriables:nil];
    self.callmanager = callmanager;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end