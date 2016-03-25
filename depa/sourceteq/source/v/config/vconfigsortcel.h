#import "appdel.h"
#import "mconfigsorprotocol.h"

@interface vconfigsortcel:UICollectionViewCell

-(void)config:(id<mconfigsorprotocol>)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIView *selector;

@end