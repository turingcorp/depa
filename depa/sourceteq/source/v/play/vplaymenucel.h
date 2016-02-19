#import "appdel.h"

@class vblur;

@interface vplaymenucel:UICollectionViewCell

-(void)config:(id<mplaymenuprotocol>)model;

@property(weak, nonatomic)vblur *blur;
@property(weak, nonatomic)UIImageView *image;

@end