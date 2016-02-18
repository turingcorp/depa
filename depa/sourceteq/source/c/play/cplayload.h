#import "appdel.h"
#import "acalldelegate.h"

@class cplay;

@interface cplayload:UIViewController<acalldelegate>

-(instancetype)init:(cplay*)play;

@property(weak, nonatomic)cplay *play;

@end