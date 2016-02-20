#import "appdel.h"
#import "msearchtypeprotocol.h"

@class msearchresult;
@class aparsersearch;

@interface msearch:NSObject

-(instancetype)init:(id<msearchtypeprotocol>)searchtype;
-(NSUInteger)count;
-(msearchresult*)item:(NSUInteger)index;
-(void)remove:(NSUInteger)index;
-(NSString*)variables;
-(void)join:(aparsersearch*)searchresults;
-(msearchresult*)next;

@property(strong, nonatomic)id<msearchtypeprotocol> searchtype;
@property(nonatomic)NSUInteger total;
@property(nonatomic)NSUInteger offset;
@property(nonatomic)NSUInteger limit;

@end