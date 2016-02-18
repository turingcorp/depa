#import "appdel.h"

@class cplay;

@interface cplayload:UIViewController

-(instancetype)init:(cplay*)play;

@property(weak, nonatomic)cplay *play;

@end