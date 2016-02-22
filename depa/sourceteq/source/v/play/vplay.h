#import "appdel.h"
#import "viewbase.h"

@class vplaymenu;
@class vplayitem;

@interface vplay:viewbase

@property(weak, nonatomic)vplaymenu *menu;
@property(weak, nonatomic)vplayitem *item;

@end