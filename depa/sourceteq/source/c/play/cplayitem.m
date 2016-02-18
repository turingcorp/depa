#import "cplayitem.h"

@implementation cplayitem

-(instancetype)init:(cplay*)play
{
    self = [super init];
    
    self.play = play;
    
    return self;
}

-(void)loadView
{
    self.view = [[vplay alloc] init:self];
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