#import "appdel.h"

@interface cpages:UIPageViewController

-(void)openconfig;
-(void)openfavorites;
-(void)recallplay;

@property(weak, nonatomic)UIViewController *current;
@property(strong, nonatomic)UIBarButtonItem *itemconfig;
@property(strong, nonatomic)UIBarButtonItem *itemplay;
@property(strong, nonatomic)UIBarButtonItem *itemliked;
@property(weak, nonatomic)UIImageView *titleview;

@end