#import "appdel.h"

@class cplay;

@interface cplayitem:UIViewController

-(instancetype)init:(cplay*)play;

@property(weak, nonatomic)cplay *play;

@end