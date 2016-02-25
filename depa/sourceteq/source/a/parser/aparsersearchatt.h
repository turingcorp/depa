#import "appdel.h"

@class aparsersearchatt;

@interface aparsersearchatt:NSObject

-(instancetype)init:(NSArray*)json;
-(NSUInteger)count;
-(aparsersearchattitem*)item:(NSUInteger)index;

@end