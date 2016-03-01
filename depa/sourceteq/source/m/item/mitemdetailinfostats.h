#import "appdel.h"
#import "mitemdetailinfoprotocol.h"
#import "mitemdetailinfostatsprotocol.h"

@interface mitemdetailinfostats:NSObject<mitemdetailinfoprotocol>

-(NSUInteger)count;
-(id<mitemdetailinfostatsprotocol>)item:(NSUInteger)index;

@end