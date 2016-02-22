#import "appdel.h"
#import "acalldelegate.h"

@class msearch;
@class amanager;

@interface cplay:UIPageViewController<acalldelegate>

-(void)playlike;
-(void)playno;

@property(strong, nonatomic)msearch *model;
@property(weak, nonatomic)amanager *callmanager;
@property(weak, nonatomic)UIViewController *current;

@end