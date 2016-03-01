#import "vitemlocationmenu.h"

@implementation vitemlocationmenu

-(instancetype)init:(citemlocation*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.1]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setClipsToBounds:YES];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"aback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonback setImage:[[UIImage imageNamed:@"aback"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonback.imageView setTintColor:colormain];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttondepa = [[UIButton alloc] init];
    [buttondepa setClipsToBounds:YES];
    [buttondepa setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttondepa setImage:[[UIImage imageNamed:@"apt"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttondepa setImage:[[UIImage imageNamed:@"apt"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttondepa.imageView setTintColor:[UIColor whiteColor]];
    [buttondepa.imageView setClipsToBounds:YES];
    [buttondepa.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttondepa addTarget:self action:@selector(actiondepa:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *border = [[UIView alloc] init];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setClipsToBounds:YES];
    [border setUserInteractionEnabled:NO];
    [border setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2]];
    
    [self addSubview:border];
    [self addSubview:buttonback];
    [self addSubview:buttondepa];
    
    NSDictionary *views = @{@"border":border, @"back":buttonback, @"depa":buttondepa};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[back(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[depa(70)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[depa(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

-(void)actiondepa:(UIButton*)button
{
    [self.controller.viewlocation centeritem];
}

-(void)actionuser:(UIButton*)button
{
    [self.controller.viewlocation centeruser];
}

#pragma mark public

-(void)showuserbutton
{
    UIButton *buttonuser = [[UIButton alloc] init];
    [buttonuser setClipsToBounds:YES];
    [buttonuser setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonuser setBackgroundColor:colormain];
    [buttonuser.layer setCornerRadius:20];
    [buttonuser addTarget:self action:@selector(actionuser:) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary *views = @{@"user":buttonuser};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[user(40)]-90-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[user(40)]" options:0 metrics:metrics views:views]];
}

@end