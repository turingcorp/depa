#import "appdel.h"

@class mlikeditem;

@interface mliked:NSObject

-(NSUInteger)count;
-(mlikeditem*)item:(NSUInteger)index;

@property(strong, nonatomic)UIFont *fonttitle;
@property(strong, nonatomic)UIFont *fontprice;

@end