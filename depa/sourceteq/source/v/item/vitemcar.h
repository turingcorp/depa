#import "appdel.h"

@class citem;
@class vitemcarpaging;
@class vitemcarcel;

@interface vitemcar:UIView

-(instancetype)init:(citem*)controller;
-(void)refresh;

@property(weak, nonatomic)citem *controller;
@property(weak, nonatomic)vitemcarpaging *paging;
@property(weak, nonatomic)vitemcarcel *cellcurrent;
@property(weak, nonatomic)vitemcarcel *cellnext;

@end