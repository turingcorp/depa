#import "appdel.h"

@class aimateqitem;

@interface vitemcarcel:UICollectionViewCell

-(void)config:(aimateqitem*)image;

@property(weak, nonatomic)aimateqitem *image;

@end