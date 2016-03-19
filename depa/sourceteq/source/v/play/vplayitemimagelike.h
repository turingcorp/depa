#import "appdel.h"

@class vplayitemimagelikestar;

@interface vplayitemimagelike:UIView

@property(strong, nonatomic)NSMutableArray<vplayitemimagelikestar*> *stars;
@property(strong, nonatomic)NSTimer *timer;

@end