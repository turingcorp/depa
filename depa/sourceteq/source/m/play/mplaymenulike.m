#import "mplaymenulike.h"

@implementation mplaymenulike

#pragma mark -
#pragma mark play protocol

-(NSString*)assetname
{
    NSString *name = @"like";
    
    return name;
}

-(UIColor*)tintcolor
{
    UIColor *color = colorsecond;
    
    return color;
}

-(void)action:(cplayitem*)controller
{
    vplay *view = (vplay*)controller.view;
    [view.item.image like];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 500), dispatch_get_main_queue(),
                   ^
                   {
                       [controller playlike];
                   });
}

@end