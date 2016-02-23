#import "appdel.h"
#import "mconfigtypprotocol.h"

@interface mconfigtyp:NSObject

-(NSUInteger)count;
-(id<mconfigtypprotocol>)item:(NSUInteger)index;
-(id<mconfigtypprotocol>)itemwithtype:(search_type)type;

@end