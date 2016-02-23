#import "appdel.h"
#import "mconfigtypprotocol.h"

@interface mconfigtyp:NSObject

-(NSUInteger)count;
-(id<mconfigtypprotocol>)item:(NSUInteger)index;

@end