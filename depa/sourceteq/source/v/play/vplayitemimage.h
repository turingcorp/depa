#import "appdel.h"

@class msearchresult;

@interface vplayitemimage:UIView

-(instancetype)init:(msearchresult*)model;

@property(weak, nonatomic)msearchresult *model;

@end