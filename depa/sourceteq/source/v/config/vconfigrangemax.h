#import "appdel.h"
#import "vconfigcelprotocol.h"

@interface vconfigrangemax:UIView<vconfigcelprotocol>

@property(weak, nonatomic)UISwitch *check;
@property(weak, nonatomic)UISlider *slider;
@property(weak, nonatomic)UILabel *label;
@property(nonatomic)NSUInteger currentprice;

@end