#import "appdel.h"

@class vitemlocation;

@interface citemlocation:UIViewController

+(void)show:(mitemdetail*)item;
-(void)back;

@property(weak, nonatomic)mitemdetail *item;
@property(strong, nonatomic)vitemlocation *view;

@end
