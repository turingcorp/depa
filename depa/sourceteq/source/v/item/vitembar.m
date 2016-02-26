#import "vitembar.h"

@implementation vitembar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:colormain];
    
    UIButton *button = [[UIButton alloc] init];
    
    [self addSubview:button];
    
    return self;
}

@end