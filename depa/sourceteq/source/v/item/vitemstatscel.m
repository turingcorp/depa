#import "vitemstatscel.h"

@implementation vitemstatscel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setTintColor:colorsecond];
    self.image = image;
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:fontname size:18]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
    self.label = label;
    
    [self addSubview:image];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[image]-40-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(id<mitemdetailinfostatsprotocol>)model
{
    [self.image setImage:[[UIImage imageNamed:[model asset]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.label setText:[model title]];
}

@end