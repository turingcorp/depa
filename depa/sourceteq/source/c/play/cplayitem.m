#import "cplayitem.h"

@implementation cplayitem

-(instancetype)init:(cplay*)play item:(msearchresult*)item
{
    self = [super init];
    
    self.play = play;
    self.item = item;
    
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

#pragma mark public

-(void)playlike
{
    [self.item playlike];
    [self.play playlike];
}

-(void)playno
{
    [self.item playno];
    [self.play playno];
}

@end