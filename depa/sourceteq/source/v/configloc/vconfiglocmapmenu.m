#import "vconfiglocmapmenu.h"

@implementation vconfiglocmapmenu

-(instancetype)init:(vconfiglocmap*)map
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.map = map;
    vblur *blur = [vblur light:NO];
    
    UIButton *btnaccept = [[UIButton alloc] init];
    [btnaccept setClipsToBounds:YES];
    [btnaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnaccept setImage:[[UIImage imageNamed:@"accept"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btnaccept setImage:[[UIImage imageNamed:@"accept"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [btnaccept.imageView setTintColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [btnaccept.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btnaccept.imageView setClipsToBounds:YES];
    
    UIButton *btnuser = [[UIButton alloc] init];
    [btnuser setClipsToBounds:YES];
    [btnuser setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnuser setImage:[[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btnuser setImage:[[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [btnuser.imageView setTintColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [btnuser.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btnuser.imageView setClipsToBounds:YES];
    [btnuser setHidden:YES];
    self.btnuser = btnuser;
    
    [self addSubview:blur];
    [self addSubview:btnaccept];
    [self addSubview:btnuser];
    
    NSDictionary *views = @{@"blur":blur, @"accept":btnaccept, @"user":btnuser};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[user(80)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[accept(80)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[user]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[accept]-5-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)showbuttonuser
{
    
}

@end