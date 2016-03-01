#import "appdel.h"

@class mitemdetail;

@interface citemcontact:UIViewController

+(void)show:(mitemdetail*)item;
-(void)call;
-(void)close;
-(void)browse;

@property(weak, nonatomic)mitemdetail *item;

@end