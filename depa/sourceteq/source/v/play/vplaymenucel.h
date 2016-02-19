#import "appdel.h"

@interface vplaymenucel:UICollectionViewCell

-(void)config:(id<mplaymenuprotocol>)model;

@property(weak, nonatomic)id<mplaymenuprotocol> model;
@property(weak, nonatomic)UIImageView *image;

@end