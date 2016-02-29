#import "appdel.h"

@class mitemdetail;

@interface citem:UIViewController<acalldelegate>

-(instancetype)init:(mitemdetail*)item;
-(void)back;

@property(weak, nonatomic)amanager *manager;
@property(strong, nonatomic)mitemdetail *item;

@end