#import "appdel.h"

@class msearchresult;
@class aparsersearch;

@interface msearch:NSObject

-(void)remove:(NSUInteger)index;
-(NSString*)variables;
-(void)stats:(aparsersearch*)searchresults;
-(void)join:(aparsersearch*)searchresults;
-(msearchresult*)next;

@property(strong, nonatomic)NSMutableArray<msearchresult*> *items;
@property(copy, nonatomic)NSString *displayname;
@property(nonatomic)NSUInteger total;
@property(nonatomic)NSUInteger offset;
@property(nonatomic)NSUInteger current;
@property(nonatomic)BOOL busy;

@end