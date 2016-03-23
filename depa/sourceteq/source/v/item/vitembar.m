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
    
    UIButton *buttonstar = [[UIButton alloc] init];
    [buttonstar setImage:[[UIImage imageNamed:@"like"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonstar setImage:[[UIImage imageNamed:@"like"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonstar.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonstar.imageView setTintColor:[UIColor whiteColor]];
    [buttonstar setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *buttonshare = [[UIButton alloc] init];
    [buttonshare setImage:[[UIImage imageNamed:@"share"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonshare setImage:[[UIImage imageNamed:@"share"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonshare.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonshare.imageView setTintColor:[UIColor whiteColor]];
    [buttonshare setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:button];
    [self addSubview:buttonstar];
    [self addSubview:buttonshare];
    
    NSDictionary *views = @{@"button":button, @"buttonstar":buttonstar, @"buttonshare":buttonshare};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonstar(50)]-0-[buttonshare(50)]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[button(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonstar(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonshare(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark action

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end