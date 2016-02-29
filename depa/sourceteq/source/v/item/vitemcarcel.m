#import "vitemcarcel.h"

@implementation vitemcarcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(void)config:(aimateqitem*)image
{
    self.image = image;
}

@end