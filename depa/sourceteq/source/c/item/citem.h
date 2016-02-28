#import "appdel.h"

@interface citem:UIViewController<acalldelegate>

-(instancetype)init:(NSString*)itemid type:(search_type)type mode:(search_mode)mode;
-(void)back;

@property(weak, nonatomic)amanager *manager;

@end