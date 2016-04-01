#import "appdel.h"
#import "vconfigcelprotocol.h"

@interface vconfigrangemin:UIView<vconfigcelprotocol>

@property(weak, nonatomic)UISwitch *check;
@property(weak, nonatomic)UISlider *slider;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)NSTimer *timer;
@property(nonatomic)NSUInteger currentprice;

@end