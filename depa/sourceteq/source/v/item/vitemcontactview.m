#import "vitemcontactview.h"

@implementation vitemcontactview

-(instancetype)init:(citemcontact*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vblur *blur = [vblur light:NO];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setImage:[[UIImage imageNamed:@"contact"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icon setTintColor:colormain];
    
    [self addSubview:blur];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"blur":blur, @"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[icon(80)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end