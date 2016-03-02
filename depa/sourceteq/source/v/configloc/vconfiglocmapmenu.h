#import "appdel.h"

@class vconfiglocmap;

@interface vconfiglocmapmenu:UIView

-(instancetype)init:(vconfiglocmap*)map;
-(void)showbuttonuser;

@property(weak, nonatomic)vconfiglocmap *map;
@property(weak, nonatomic)UIButton *btnuser;

@end