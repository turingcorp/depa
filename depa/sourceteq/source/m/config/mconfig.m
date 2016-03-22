#import "mconfig.h"

@implementation mconfig

-(instancetype)init
{
    self = [super init];
    
    self.items = @[
                   [[mconfigtype alloc] init],
                   [[mconfigmode alloc] init],
                   [[mconfigsort alloc] init],
                   [[mconfiglocation alloc] init],
                   [[mconfiglike alloc] init],
                   [[mconfigno alloc] init]
                   ];
    
    return self;
}

@end