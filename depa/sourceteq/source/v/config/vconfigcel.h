#import "appdel.h"
#import "vconfigcelprotocol.h"

@interface vconfigcel:UICollectionViewCell

-(void)config:(UIView<vconfigcelprotocol>*)view;

@property(weak, nonatomic)UIView<vconfigcelprotocol> *overview;

@end