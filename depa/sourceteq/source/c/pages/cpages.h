#import "appdel.h"

@class vbadge;
@class vlikedbutton;

@interface cpages:UIPageViewController

-(void)openconfig;

@property(strong, nonatomic)UIBarButtonItem *itemconfig;
@property(strong, nonatomic)UIBarButtonItem *itemplay;
@property(strong, nonatomic)vlikedbutton *itemliked;
@property(weak, nonatomic)vbadge *badge;
@property(weak, nonatomic)UIImageView *titleview;

@end