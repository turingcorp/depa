#import "appdel.h"

@class msearchresult;
@class vplayitemimage;
@class vplayiteminfo;

@interface vplayitem:UIView

-(instancetype)init:(msearchresult*)model;

@property(weak, nonatomic)vplayitemimage *image;
@property(weak, nonatomic)vplayiteminfo *info;
@property(weak, nonatomic)msearchresult *model;

@end