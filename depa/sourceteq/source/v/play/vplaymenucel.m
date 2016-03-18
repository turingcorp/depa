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
    
    UIImageView *border = [[UIImageView alloc] init];
    [border setContentMode:UIViewContentModeScaleAspectFit];
    [border setClipsToBounds:YES];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setImage:[[UIImage imageNamed:@"menuborder"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.border = border;

    [self addSubview:border];
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[image]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[border]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self.image setTintColor:[[self.model tintcolor] colorWithAlphaComponent:0.2]];
        [self.border setTintColor:[self.model tintcolor]];
    }
    else
    {
        [self.image setTintColor:[self.model tintcolor]];
        [self.border setTintColor:[UIColor colorWithWhite:0 alpha:0.05]];
    }
}

#pragma mark public

-(void)config:(id<mplaymenuprotocol>)model
{
    self.model = model;
    
    [self.image setImage:[[UIImage imageNamed:[model assetname]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self hover];
}

@end