#import "appdel.h"

@class mitemdetail;

@interface citemcontact:UIViewController

+(void)show:(mitemdetail*)item;

@property(weak, nonatomic)mitemdetail *item;

@end