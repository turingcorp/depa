#import "appdel.h"

@class mitemdetailinfoaddress;

@interface vitemceladdress:UIView

-(instancetype)init:(mitemdetailinfoaddress*)model;

@property(weak, nonatomic)mitemdetailinfoaddress *model;

@end