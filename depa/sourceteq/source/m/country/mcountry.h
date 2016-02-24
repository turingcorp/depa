#import "appdel.h"

@class mcountryitem;

@interface mcountry:NSObject

+(instancetype)singleton;
-(NSUInteger)count;
-(mcountryitem*)item:(NSUInteger)index;

@end