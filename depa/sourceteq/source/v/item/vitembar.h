#import "appdel.h"

@class citem;

@interface vitembar:UIView

-(instancetype)init:(citem*)controller;

@property(weak, nonatomic)citem *controller;

@end