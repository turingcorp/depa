#import "appdel.h"

@class mitemdetail;
@class vitem;

@interface citem:UIViewController<acalldelegate>

-(instancetype)init:(mitemdetail*)item;
-(void)back;
-(void)tryagain;

@property(weak, nonatomic)amanager *manager;
@property(weak, nonatomic)vitem *viewitem;
@property(strong, nonatomic)mitemdetail *item;

@end