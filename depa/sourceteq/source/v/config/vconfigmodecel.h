#import "appdel.h"
#import "mconfigmodprotocol.h"

@interface vconfigmodecel:UICollectionViewCell

-(void)config:(id<mconfigmodprotocol>)model;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *label;

@end