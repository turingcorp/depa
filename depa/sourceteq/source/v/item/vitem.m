#import "vitem.h"

@implementation vitem

-(instancetype)init:(UIViewController*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

@end