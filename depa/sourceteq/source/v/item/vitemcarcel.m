#import "vitemcarcel.h"

@implementation vitemcarcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    
    return self;
}

#pragma mark public

-(void)config:(aimateqitem*)image
{
    self.image = image;
}

@end