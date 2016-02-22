#import "vconfigloc.h"

@implementation vconfigloc

-(instancetype)init:(cconfigloc*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

@end