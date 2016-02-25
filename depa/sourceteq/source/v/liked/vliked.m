#import "vliked.h"

@implementation vliked

-(instancetype)init:(cliked*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    
    return self;
}

@end