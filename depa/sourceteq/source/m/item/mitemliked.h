#import "appdel.h"

@class mitemitem;

@interface mitemliked:NSObject

-(NSUInteger)count;
-(mitemitem*)item:(NSUInteger)index;

@end