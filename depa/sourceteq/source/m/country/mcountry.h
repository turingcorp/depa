#import "appdel.h"

@class mcountryitem;

@interface mcountry:NSObject

-(NSUInteger)count;
-(mcountryitem*)item:(NSUInteger)index;

@end