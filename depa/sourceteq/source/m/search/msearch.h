#import "appdel.h"

@class msearchresult;
@class aparsersearch;

@interface msearch:NSObject

-(NSUInteger)count;
-(msearchresult*)item:(NSUInteger)index;
-(void)remove:(NSUInteger)index;
-(NSString*)variables;
-(void)stats:(aparsersearch*)searchresults;
-(void)join:(aparsersearch*)searchresults;
-(msearchresult*)next;

@property(copy, nonatomic)NSString *displayname;
@property(nonatomic)NSUInteger total;
@property(nonatomic)NSUInteger offset;
@property(nonatomic)NSUInteger limit;
@property(nonatomic)NSUInteger current;
@property(nonatomic)BOOL busy;

@end