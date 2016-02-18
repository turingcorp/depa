#import "appdel.h"
#import "viewbase.h"

@class vspinner;

@interface vplayload:viewbase

-(void)showretry;
-(void)showloading;

@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIButton *button;
@property(weak, nonatomic)NSLayoutConstraint *constraint;

@end