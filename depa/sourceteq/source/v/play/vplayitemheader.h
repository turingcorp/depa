#import "appdel.h"

@class msearchresult;

@interface vplayitemheader:UIView

-(instancetype)init:(msearchresult*)model;

@property(weak, nonatomic)msearchresult *model;

@end