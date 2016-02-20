#import "appdel.h"
#import "msearchtypeprotocol.h"

@class msearchresult;
@class aparsersearch;

@interface msearch:NSObject

-(instancetype)init:(id<msearchtypeprotocol>)searchtype mode:(id<msearchmodeprotocol>)searchmode;
-(NSUInteger)count;
-(msearchresult*)item:(NSUInteger)index;
-(void)remove:(NSUInteger)index;
-(NSString*)variables;
-(void)join:(aparsersearch*)searchresults;
-(msearchresult*)next;
-(NSString*)displayname;

@property(strong, nonatomic)id<msearchtypeprotocol> searchtype;
@property(strong, nonatomic)id<msearchmodeprotocol> searchmode;
@property(nonatomic)NSUInteger total;
@property(nonatomic)NSUInteger offset;
@property(nonatomic)NSUInteger limit;
@property(nonatomic)NSUInteger current;

@end