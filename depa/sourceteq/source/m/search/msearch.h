#import "appdel.h"

@class msearchresult;

@interface msearch:NSObject

-(NSUInteger)count;
-(msearchresult*)item:(NSUInteger)index;
-(NSString*)variables;

@end