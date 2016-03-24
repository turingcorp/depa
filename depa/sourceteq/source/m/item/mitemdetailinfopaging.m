#import "mitemdetailinfopaging.h"

@implementation mitemdetailinfopaging

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item view:(vitem*)view
{
    self.item = item;
    self.view = view;
}

-(UIView*)overview
{
    vitemcarpaging *view = [[vitemcarpaging alloc] init:self.item.images.items];
    [self.view.car loadpaging:view];
    
    return view;
}

-(CGFloat)height
{
    return 26;
}

@end