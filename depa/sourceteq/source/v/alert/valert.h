#import "appdel.h"

@interface valert:UIView

+(void)alert:(NSString*)message inview:(UIView*)view offsettop:(CGFloat)offsettop;

@property(strong, nonatomic)NSTimer *timer;

@end