#import "cconfig.h"

@implementation cconfig

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