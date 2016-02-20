#import "vplayitemimage.h"

@implementation vplayitemimage

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    self.model = model;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    self.image = image;
    
    [self addSubview:image];
    
    return self;
}

@end