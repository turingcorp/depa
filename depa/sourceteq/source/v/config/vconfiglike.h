#import "appdel.h"
#import "vconfigcelprotocol.h"

@interface vconfiglike:UIView<vconfigcelprotocol>

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIImageView *icon;

@end