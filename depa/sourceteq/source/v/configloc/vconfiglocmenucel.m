#import "vconfiglocmenucel.h"

@implementation vconfiglocmenucel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:15]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    self.label = label;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    self.image = image;
    
    [self addSubview:image];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-7-[image(27)]" options:0 metrics:metrics views:views]];
    
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
        [self.image setTintColor:[UIColor whiteColor]];
        [self.label setTextColor:[UIColor whiteColor]];
        [self setBackgroundColor:colormain];
    }
    else
    {
        [self.image setTintColor:[UIColor colorWithWhite:0 alpha:0.25]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [self setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark public

-(void)config:(id<mconfiglocprotocol>)model
{
    [self.label setText:[model title]];
    [self.image setImage:[[UIImage imageNamed:[model assetname]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self hover];
}

@end