#import "appdel.h"

@class mlikeditem;

@interface mliked:NSObject

-(void)load;

@property(strong, nonatomic)UIFont *fonttitle;
@property(strong, nonatomic)UIFont *fontprice;
@property(strong, nonatomic)NSMutableArray<mlikeditem*> *items;

@end