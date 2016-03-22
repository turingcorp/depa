#import "appdel.h"
#import "vconfigcelprotocol.h"

@interface vconfigno:UIView<vconfigcelprotocol>

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIImageView *icon;
@property(weak, nonatomic)UIView *selector;
@property(weak, nonatomic)NSLayoutConstraint *layoutmarginleft;

@end