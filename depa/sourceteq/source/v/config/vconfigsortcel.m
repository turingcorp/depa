#import "vconfigsortcel.h"

@implementation vconfigsortcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    self.image = image;
    
    UIView *selector = [[UIView alloc] init];
    [selector setBackgroundColor:colormain];
    [selector setClipsToBounds:YES];
    [selector setUserInteractionEnabled:NO];
    [selector setTranslatesAutoresizingMaskIntoConstraints:NO];
    [selector.layer setCornerRadius:4];
    self.selector = selector;
    
    [self addSubview:selector];
    [self addSubview:label];
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image, @"label":label, @"selector":selector};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-18-[image(44)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-25-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[selector]-1-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[selector]-15-|" options:0 metrics:metrics views:views]];
    
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
        [self.label setFont:[UIFont fontWithName:fontboldname size:14]];
        [self.selector setHidden:NO];
    }
    else
    {
        [self.image setTintColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [self.label setFont:[UIFont fontWithName:fontname size:14]];
        [self.selector setHidden:YES];
    }
}

#pragma mark public

-(void)config:(id<mconfigsorprotocol>)model
{
    [self.label setText:[model title]];
    [self.image setImage:[[UIImage imageNamed:[model assetname]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self hover];
}

@end