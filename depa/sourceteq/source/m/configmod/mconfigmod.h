#import "appdel.h"
#import "mconfigmodprotocol.h"

@interface mconfigmod:NSObject

-(NSUInteger)count;
-(id<mconfigmodprotocol>)item:(NSUInteger)index;

@end