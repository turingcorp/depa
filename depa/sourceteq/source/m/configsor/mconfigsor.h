#import "appdel.h"
#import "mconfigsorprotocol.h"

@interface mconfigsor:NSObject

-(NSUInteger)count;
-(id<mconfigsorprotocol>)item:(NSUInteger)index;
-(id<mconfigsorprotocol>)itemwithtype:(search_order)type;

@end