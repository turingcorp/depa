#import "vitembar.h"

@implementation vitembar

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:colormain];
    
    self.controller = controller;
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[[UIImage imageNamed:@"aback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:@"aback"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [button.imageView setClipsToBounds:YES];
    [button.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.1]];
    [button addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFont:[UIFont fontWithName:fontboldname size:14]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setUserInteractionEnabled:NO];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:controller.item.displaytitle];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:button];
    [self addSubview:label];
    
    NSDictionary *views = @{@"button":button, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[button(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[label]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label(45)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark action

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end