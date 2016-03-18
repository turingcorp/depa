#import "vitemceladdress.h"

@implementation vitemceladdress

-(instancetype)init:(mitemdetailinfoaddress*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    self.model = model;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setAttributedText:model.mutstring];
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [button.imageView setClipsToBounds:YES];
    [button.imageView setTintColor:colorsecond];
    [button setImage:[[UIImage imageNamed:@"map"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:@"map"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(actionmap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"icon":button};
    NSDictionary *metrics = @{@"horizontal":@(marginhorizontal), @"vertical":@(marginvertical), @"iconheight":@(iconheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(horizontal)-[label]-(horizontal)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-120-[icon]-120-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(vertical)-[label]-(vertical)-[icon(iconheight)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionmap:(UIButton*)button
{
    [citemlocation show:self.model.item];
}

@end