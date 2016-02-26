#import "appdel.h"

@class citem;

@interface vitemcontact:UIButton

-(instancetype)init:(citem*)controller;

@property(weak, nonatomic)citem *controller;

@end