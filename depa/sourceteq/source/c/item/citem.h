#import "appdel.h"

@class mitemdetail;
@class vitem;

@interface citem:UIViewController<acalldelegate>

+(void)show:(mitemdetail*)item;
-(void)back;
-(void)tryagain;
-(void)contact;

@property(weak, nonatomic)amanager *manager;
@property(strong, nonatomic)mitemdetail *item;

@end