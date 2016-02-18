#import "appdel.h"
#import "acalldelegate.h"

@class cplay;
@class amanager;

@interface cplayload:UIViewController<acalldelegate>

-(instancetype)init:(cplay*)play;

@property(weak, nonatomic)cplay *play;
@property(weak, nonatomic)amanager *callmanager;

@end