#import "mitemdetailinfostats.h"

@implementation mitemdetailinfostats

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item collection:(UICollectionView*)collection
{
}

-(UIView*)overview
{
    UIView *overview = [[UIView alloc] init];
    [overview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return overview;
}

-(CGFloat)height
{
    return 100;
}

@end