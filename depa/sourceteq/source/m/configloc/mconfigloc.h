#import "appdel.h"
#import "mconfiglocprotocol.h"

@interface mconfigloc:NSObject

-(NSUInteger)count;
-(id<mconfiglocprotocol>)item:(NSUInteger)index;

@end