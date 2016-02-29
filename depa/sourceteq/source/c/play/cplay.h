#import "appdel.h"
#import "acalldelegate.h"

@class msearch;
@class amanager;

@interface cplay:UIPageViewController<acalldelegate>

-(instancetype)init:(BOOL)synch;
-(void)playlike;
-(void)playno;
-(void)playitem;

@property(strong, nonatomic)msearch *model;
@property(weak, nonatomic)amanager *callmanager;
@property(weak, nonatomic)UIViewController *current;

@end