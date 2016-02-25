#import "appdel.h"

@class aparsersearchatt;

@interface aparsersearchatt:NSObject

-(instancetype)init:(NSArray*)json;
-(NSUInteger)count;
-(aparsersearchattitem*)item:(NSUInteger)index;
-(aparsersearchattitem*)itemfor:(search_attr)attr;

@end