#import "appdel.h"

@class msearchresult;
@class aparsersearch;

@interface msearch:NSObject

-(NSUInteger)count;
-(msearchresult*)item:(NSUInteger)index;
-(NSString*)variables;
-(void)join:(aparsersearch*)searchresults;

@property(nonatomic)NSUInteger total;
@property(nonatomic)NSUInteger offset;
@property(nonatomic)NSUInteger limit;

@end