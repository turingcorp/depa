#import "appdel.h"
#import "mconfigprotocol.h"

@interface vconfiglocmenucel:UICollectionViewCell

-(void)config:(id<mconfiglocprotocol>)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIImageView *image;

@end