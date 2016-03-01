#import "vitemlocationmenu.h"

@implementation vitemlocationmenu

-(instancetype)init:(citemlocation*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.08]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setClipsToBounds:YES];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"aback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"aback"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonback.imageView setTintColor:colormain];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *border = [[UIView alloc] init];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setClipsToBounds:YES];
    [border setUserInteractionEnabled:NO];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    
    [self addSubview:border];
    [self addSubview:buttonback];
    
    NSDictionary *views = @{@"border":border, @"back":buttonback};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back(80)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[back]-1-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end