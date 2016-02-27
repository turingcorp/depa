#import "vitemcontact.h"

@implementation vitemcontact

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    CGFloat circleside = 50;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setImage:[[UIImage imageNamed:@"contact"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTintColor:[UIColor whiteColor]];
    
    UIView *background = [[UIView alloc] init];
    [background setBackgroundColor:colormain];
    [background setClipsToBounds:YES];
    [background setUserInteractionEnabled:NO];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background.layer setCornerRadius:4];
    
    [background addSubview:image];
    [self addSubview:background];
    
    NSDictionary *views = @{@"background":background, @"image":image};
    NSDictionary *metrics = @{@"circleside":@(circleside)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[background(circleside)]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[background(circleside)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[image]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[image]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end