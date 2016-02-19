#import "appdel.h"
#import "mplaymenuprotocol.h"

@interface mplaymenu:NSObject

-(NSUInteger)count;
-(id<mplaymenuprotocol>)item:(NSUInteger)index;

@end