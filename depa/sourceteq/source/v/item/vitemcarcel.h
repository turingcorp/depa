#import "appdel.h"

@class aimateqitem;

@interface vitemcarcel:UICollectionViewCell

-(void)config:(aimateqitem*)apiimage;

@property(weak, nonatomic)aimateqitem *apiimage;
@property(weak, nonatomic)UIImageView *image;

@end