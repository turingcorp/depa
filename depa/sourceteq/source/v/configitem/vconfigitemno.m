#import "vconfigitemno.h"

@implementation vconfigitemno

-(instancetype)init:(cconfigitemno*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIColor *color = [UIColor colorWithRed:1 green:0.33 blue:0 alpha:1];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setImage:[[UIImage imageNamed:@"no"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTintColor:color];
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[image(80)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end