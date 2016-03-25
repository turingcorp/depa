#import "mplaymenuno.h"

@implementation mplaymenuno

#pragma mark -
#pragma mark play protocol

-(NSString*)assetname
{
    NSString *name = @"no";
    
    return name;
}

-(UIColor*)tintcolor
{
    UIColor *color = colormain;
    
    return color;
}

-(void)action:(cplayitem*)controller
{
    vplay *view = (vplay*)controller.view;
    [view.item.image no];
    
    [controller playno];
}

@end