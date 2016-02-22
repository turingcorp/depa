#import "appdel.h"
#import "viewbase.h"

@class vplaymenu;

@interface vplay:viewbase

-(void)displaylike;
-(void)displayno;

@property(weak, nonatomic)vplaymenu *menu;

@end