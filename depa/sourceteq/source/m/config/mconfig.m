#import "mconfig.h"

@implementation mconfig

-(instancetype)init
{
    self = [super init];
    
    self.items = @[
                   [[mconfigsectionfilters alloc] init],
                   [[mconfigsectionoptions alloc] init],
                   ];
    
    return self;
}

@end