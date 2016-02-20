#import "appdel.h"

@class msearchresult;

@interface vplayitem:UIView

-(instancetype)init:(msearchresult*)model;

@property(weak, nonatomic)msearchresult *model;
@property(weak, nonatomic)UIImageView *image;

@end