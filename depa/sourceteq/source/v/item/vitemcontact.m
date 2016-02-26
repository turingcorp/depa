#import "vitemcontact.h"

@implementation vitemcontact

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    CGFloat circleside = 40;
    
    UIView *background = [[UIView alloc] init];
    [background setBackgroundColor:colormain];
    [background setClipsToBounds:YES];
    [background setUserInteractionEnabled:NO];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.layer setCornerRadius:circleside / 2.0];
    
    [self addSubview:background];
    
    NSDictionary *views = @{@"background":background};
    NSDictionary *metrics = @{@"circleside":@(circleside)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[background(circleside)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[background(circleside)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end