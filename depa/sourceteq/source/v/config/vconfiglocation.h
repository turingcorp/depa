#import "appdel.h"
#import "vconfigcelprotocol.h"

@interface vconfiglocation:UIView<vconfigcelprotocol>

@property(weak, nonatomic)UILabel *labellocation;
@property(weak, nonatomic)UILabel *change;
@property(weak, nonatomic)UIView *border;
@property(weak, nonatomic)UIView *selector;

@end