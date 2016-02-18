#import "vplay.h"

@implementation vplay

-(instancetype)init:(cplayitem*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor grayColor]];
    
    NSDictionary *views = @{};
    NSDictionary *metrics = @{};
    
    return self;
}

@end