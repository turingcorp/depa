#import "mitemdetailinfopaging.h"

@implementation mitemdetailinfopaging

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item collection:(UICollectionView*)collection
{
    self.item = item;
}

-(UIView*)overview
{
    vitemcarpaging *view = [[vitemcarpaging alloc] init:self.item.images.items];
    
    return view;
}

-(CGFloat)height
{
    return 20;
}

@end