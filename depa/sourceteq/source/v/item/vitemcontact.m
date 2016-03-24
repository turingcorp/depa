#import "vitemcontact.h"

@implementation vitemcontact

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    CGFloat circleside = 50;
    
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
    [background setHidden:YES];
    self.background = background;
    
    [self addSubview:background];
    [self addSubview:image];
    
    NSDictionary *views = @{@"background":background, @"image":image};
    NSDictionary *metrics = @{@"circleside":@(circleside)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[background]-(-10)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[background(circleside)]" options:0 metrics:metrics views:views]];
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
        [self.image setTintColor:[UIColor colorWithWhite:0 alpha:0.8]];
        [self.background setBackgroundColor:[colormain colorWithAlphaComponent:0.4]];
    }
    else
    {
        [self.image setTintColor:[UIColor whiteColor]];
        [self.background setBackgroundColor:[colormain colorWithAlphaComponent:0.8]];
    }
}

@end