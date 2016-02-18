#import "vspinner.h"

@implementation vspinner

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self setAnimationDuration:1.5];
    self.animationImages = @[
                             [UIImage imageNamed:@"loader0"],
                             [UIImage imageNamed:@"loader1"],
                             [UIImage imageNamed:@"loader2"],
                             [UIImage imageNamed:@"loader3"],
                             [UIImage imageNamed:@"loader4"]
                             ];
    
    return self;
}

@end