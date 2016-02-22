#import "appdel.h"

@class msearch;

@interface cplay:UIPageViewController

-(void)playlike;
-(void)playno;

@property(strong, nonatomic)msearch *model;
@property(weak, nonatomic)UIViewController *current;

@end