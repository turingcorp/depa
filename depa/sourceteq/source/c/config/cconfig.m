#import "cconfig.h"

@implementation cconfig

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [(vconfig*)self.view didappear];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_config];
}

-(void)loadView
{
    self.view = [[vconfig alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end