#import "appdel.h"
#import "mconfigprotocol.h"

@interface mconfig:NSObject

@property(strong, nonatomic)NSArray<id<mconfigprotocol>> *items;

@end