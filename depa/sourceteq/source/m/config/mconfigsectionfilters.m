#import "mconfigsectionfilters.h"

@implementation mconfigsectionfilters

-(instancetype)init
{
    self = [super init];
    
    self.name = NSLocalizedString(@"config_section_filters", nil);
    self.items = @[
                   [[mconfigtype alloc] init],
                   [[mconfigmode alloc] init],
                   [[mconfigsort alloc] init],
                   [[mconfigrangemin alloc] init],
                   [[mconfigrangemax alloc] init],
                   [[mconfiglocation alloc] init]
                   ];
    
    return self;
}

@end