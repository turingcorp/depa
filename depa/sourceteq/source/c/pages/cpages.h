#import "appdel.h"

@class vbadge;

@interface cpages:UIPageViewController

-(void)openconfig;

@property(strong, nonatomic)UIBarButtonItem *itemconfig;
@property(strong, nonatomic)UIBarButtonItem *itemfavorites;
@property(strong, nonatomic)UIBarButtonItem *itemplay;
@property(weak, nonatomic)vbadge *badge;
@property(weak, nonatomic)UIImageView *titleview;

@end