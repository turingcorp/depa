#import "appdel.h"

@class msearchresult;
@class vplayitemimage;

@interface vplayitem:UIView

-(instancetype)init:(msearchresult*)model;

@property(weak, nonatomic)vplayitemimage *image;
@property(weak, nonatomic)msearchresult *model;

@end