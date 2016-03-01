#import "appdel.h"

@class vitemlocation;

@interface citemlocation:UIViewController

+(void)show:(mitemdetail*)item;
-(void)back;

@property(weak, nonatomic)mitemdetail *item;
@property(weak, nonatomic)vitemlocation *viewlocation;

@end