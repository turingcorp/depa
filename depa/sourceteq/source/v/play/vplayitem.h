#import "appdel.h"
#import "viewbase.h"

@class cplayitem;

@interface vplayitem:viewbase

@property(weak, nonatomic)cplayitem *controlleritem;
@property(weak, nonatomic)UIImageView *image;

@end