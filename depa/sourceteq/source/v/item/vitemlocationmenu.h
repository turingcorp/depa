#import "appdel.h"

@class citemlocation;

@interface vitemlocationmenu:UIView

-(instancetype)init:(citemlocation*)controller;
-(void)showuserbutton;

@property(weak, nonatomic)citemlocation *controller;

@end