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
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *btnaccept = [[UIButton alloc] init];
    [btnaccept setClipsToBounds:YES];
    [btnaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnaccept setImage:[[UIImage imageNamed:@"accept"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btnaccept setImage:[[UIImage imageNamed:@"accept"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [btnaccept.imageView setTintColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [btnaccept.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btnaccept.imageView setClipsToBounds:YES];
    [btnaccept addTarget:self action:@selector(actionaccept:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnuser = [[UIButton alloc] init];
    [btnuser setClipsToBounds:YES];
    [btnuser setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnuser setImage:[[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btnuser setImage:[[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [btnuser.imageView setTintColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [btnuser.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btnuser.imageView setClipsToBounds:YES];
    [btnuser setHidden:YES];
    [btnuser addTarget:self action:@selector(actionuser:) forControlEvents:UIControlEventTouchUpInside];
    self.btnuser = btnuser;
    
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:btnaccept];
    [self addSubview:btnuser];
    
    NSDictionary *views = @{@"blur":blur, @"accept":btnaccept, @"user":btnuser, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[user(80)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[accept(80)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[user]-8-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[accept]-8-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionaccept:(UIButton*)button
{
    [button setUserInteractionEnabled:NO];
    
//    [[msettings singleton] changecountry:self.model.country location:[self.model path] locationname:self.model.title];
    [[cmain singleton] popViewControllerAnimated:YES];
}

-(void)actionuser:(UIButton*)button
{
    [self.map centeruser];
}

#pragma mark public

-(void)showbuttonuser
{
    [self.btnuser setHidden:NO];
}

@end