#import "appdel.h"

@class cpages;
@class vbadge;

@interface vlikedbutton:UIButton

-(instancetype)init:(cpages*)pages;

@property(weak, nonatomic)vbadge *badge;
@property(weak, nonatomic)UIImageView *image;

@end