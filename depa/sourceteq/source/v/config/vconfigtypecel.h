#import "appdel.h"
#import "mconfigtypprotocol.h"

@interface vconfigtypecel:UICollectionViewCell

-(void)config:(id<mconfigtypprotocol>)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIImageView *icon;

@end