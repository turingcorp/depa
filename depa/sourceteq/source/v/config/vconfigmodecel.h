#import "appdel.h"
#import "mconfigmodprotocol.h"

@interface vconfigmodecel:UICollectionViewCell

-(void)config:(id<mconfigmodprotocol>)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIView *selector;

@end