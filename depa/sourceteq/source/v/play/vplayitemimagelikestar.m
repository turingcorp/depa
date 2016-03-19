#import "vplayitemimagelikestar.h"

@implementation vplayitemimagelikestar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self setUserInteractionEnabled:NO];
    [self setImage:[UIImage imageNamed:@"ministar"]];
    
    return self;
}

@end