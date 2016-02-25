#import "appdel.h"

@class mlikeditem;

@interface mliked:NSObject

-(NSUInteger)count;
-(mlikeditem*)item:(NSUInteger)index;

@end