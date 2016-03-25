#import "appdel.h"
#import "mitemdetailinfoprotocol.h"
#import "mitemdetailinfostatsprotocol.h"

@interface mitemdetailinfostats:NSObject<mitemdetailinfoprotocol>

@property(strong, nonatomic)NSMutableArray<id<mitemdetailinfostatsprotocol>> *items;

@end