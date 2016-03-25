#import "mconfig.h"

@implementation mconfig

-(instancetype)init
{
    self = [super init];
    
    self.sections = @[
                      [[mconfigsectionfilters alloc] init],
                      [[mconfigsectionoptions alloc] init],
                      ];
    
    return self;
}

@end