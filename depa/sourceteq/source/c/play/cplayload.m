#import "cplayload.h"

@implementation cplayload

-(void)loadView
{
    self.view = [[vplayload alloc] init:self];
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