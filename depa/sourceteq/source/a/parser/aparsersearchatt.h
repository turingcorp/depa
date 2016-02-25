#import "appdel.h"

@class aparsersearchattitem;

@interface aparsersearchatt:NSObject

-(instancetype)init:(NSArray*)json;
-(NSUInteger)count;
-(aparsersearchattitem*)item:(NSUInteger)index;
-(aparsersearchattitem*)itemfor:(search_attr)attr;

@end