#import "appdel.h"
#import "viewbase.h"

@class vplayitem;
@class vplaymenu;

@interface vplay:viewbase

@property(weak, nonatomic)vplayitem *item;
@property(weak, nonatomic)vplaymenu *menu;

@end