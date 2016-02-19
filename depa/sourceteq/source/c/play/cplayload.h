#import "appdel.h"
#import "acalldelegate.h"

@class cplay;
@class vplayload;
@class amanager;

@interface cplayload:UIViewController<acalldelegate>

-(instancetype)init:(cplay*)play;
-(void)recall;

@property(weak, nonatomic)cplay *play;
@property(weak, nonatomic)vplayload *viewload;
@property(weak, nonatomic)amanager *callmanager;

@end