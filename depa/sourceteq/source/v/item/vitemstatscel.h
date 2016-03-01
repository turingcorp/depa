#import "appdel.h"

@interface vitemstatscel:UICollectionViewCell

-(void)config:(id<mitemdetailinfostatsprotocol>)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIImageView *image;

@end