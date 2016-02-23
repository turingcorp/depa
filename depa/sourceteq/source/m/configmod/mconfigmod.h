#import "appdel.h"
#import "mconfigmodprotocol.h"

@interface mconfigmod:NSObject

-(NSUInteger)count;
-(id<mconfigmodprotocol>)item:(NSUInteger)index;
-(id<mconfigmodprotocol>)modewithtype:(search_mode)type;

@end