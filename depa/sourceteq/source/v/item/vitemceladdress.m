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
    
    vitemceladdressmarker *marker = [[vitemceladdressmarker alloc] init];
    [marker addTarget:self action:@selector(actionmap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:marker];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"icon":marker};
    NSDictionary *metrics = @{@"horizontal":@(model.marginhorizontal), @"vertical":@(model.marginvertical), @"iconheight":@(model.iconheight)};
    
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