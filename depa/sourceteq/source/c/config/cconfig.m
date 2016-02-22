#import "cconfig.h"

@implementation cconfig

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [(vconfig*)self.view didappear];
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