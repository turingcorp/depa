#import "cplayload.h"

@implementation cplayload

-(instancetype)init:(cplay*)play
{
    self = [super init];
    
    self.play = play;
    
    return self;
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
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end