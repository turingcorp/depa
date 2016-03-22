#import "appdel.h"

@class vplayitem;

@interface vplayitembutton:UIButton

-(instancetype)init:(vplayitem*)item;

@property(weak, nonatomic)vplayitem *item;

@end