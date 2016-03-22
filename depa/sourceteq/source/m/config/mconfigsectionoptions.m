#import "mconfigsectionoptions.h"

@implementation mconfigsectionoptions

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"config_section_options", nil);
    
    return self;
}

@end