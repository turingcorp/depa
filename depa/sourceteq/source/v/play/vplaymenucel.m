#import "vplaymenucel.h"

@implementation vplaymenucel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;

    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        
    }
    else
    {
        
    }
}

#pragma mark public

-(void)config:(id<mplaymenuprotocol>)model
{
    [self.image setImage:[UIImage imageNamed:[model assetname]]];
    [self hover];
}

@end