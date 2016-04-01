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
    self.button = button;
    
    UIButton *buttonmap = [[UIButton alloc] init];
    [buttonmap setImage:[[UIImage imageNamed:@"map"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonmap setImage:[[UIImage imageNamed:@"map"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonmap.imageView setTintColor:[UIColor whiteColor]];
    [buttonmap.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonmap setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonmap setHidden:YES];
    [buttonmap addTarget:self action:@selector(actionmap:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonmap = buttonmap;
    
    UIButton *buttonshare = [[UIButton alloc] init];
    [buttonshare setImage:[[UIImage imageNamed:@"share"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonshare setImage:[[UIImage imageNamed:@"share"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonshare.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonshare.imageView setTintColor:[UIColor whiteColor]];
    [buttonshare setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonshare addTarget:self action:@selector(actionshare:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonshare = buttonshare;
    
    [self addSubview:button];
    [self addSubview:buttonmap];
    [self addSubview:buttonshare];
    
    NSDictionary *views = @{@"button":button, @"buttonmap":buttonmap, @"buttonshare":buttonshare};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonmap(52)]-8-[buttonshare(52)]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(50)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonmap(40)]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonshare(40)]-5-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark action

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

-(void)actionshare:(UIButton*)button
{
    NSURL *url = [NSURL URLWithString:self.controller.item.permalink];
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = self.controller.view;
        act.popoverPresentationController.sourceRect = CGRectMake((self.controller.view.bounds.size.width / 2.0) - 2, self.controller.view.bounds.size.height - 100, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:
     ^
     {
         [[analytics singleton] trackscreen:ga_screen_detail_share];
     }];
}

-(void)actionmap:(UIButton*)button
{
    [citemlocation show:self.controller.item];
}

#pragma mark public

-(void)refresh
{
    if(self.controller.item.latitude && self.controller.item.longitude)
    {
        [self.buttonmap setHidden:NO];
    }
}

-(void)buttonsalpha:(CGFloat)alpha
{
    if(alpha < 0)
    {
        alpha = 0;
    }
    else if(alpha > 1)
    {
        alpha = 1;
    }
    
    [self.button setAlpha:alpha];
    [self.buttonmap setAlpha:alpha];
    [self.buttonshare setAlpha:alpha];
}

@end