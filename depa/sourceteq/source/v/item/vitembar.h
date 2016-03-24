#import "appdel.h"

@class citem;

@interface vitembar:UIView

-(instancetype)init:(citem*)controller;
-(void)refresh;
-(void)buttonsalpha:(CGFloat)alpha;

@property(weak, nonatomic)citem *controller;
@property(weak, nonatomic)UIButton *button;
@property(weak, nonatomic)UIButton *buttonmap;
@property(weak, nonatomic)UIButton *buttonshare;

@end