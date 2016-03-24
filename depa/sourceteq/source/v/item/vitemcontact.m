#import "vitemcontact.h"

@implementation vitemcontact

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setImage:[[UIImage imageNamed:@"contact"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.image = image;
    
    UIView *background = [[UIView alloc] init];
    [background setClipsToBounds:YES];
    [background setUserInteractionEnabled:NO];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background.layer setCornerRadius:4];
    self.background = background;
    
    [self addSubview:background];
    [self addSubview:image];
    
    NSDictionary *views = @{@"background":background, @"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[background]-(-10)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[background]-15-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[image]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-18-[image]-18-|" options:0 metrics:metrics views:views]];
    
    [self hover];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.image setTintColor:[UIColor colorWithWhite:1 alpha:0.6]];
        [self.background setBackgroundColor:[colormain colorWithAlphaComponent:0.3]];
    }
    else
    {
        [self.image setTintColor:[UIColor whiteColor]];
        [self.background setBackgroundColor:colormain];
    }
}

@end