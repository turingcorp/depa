#import "appdel.h"

@class cplay;

@interface cplayitem:UIViewController

-(instancetype)init:(cplay*)play item:(msearchresult*)item;
-(void)playlike;
-(void)playno;

@property(weak, nonatomic)cplay *play;
@property(strong, nonatomic)msearchresult *item;

@end