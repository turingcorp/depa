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
    [buttonstar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonstar addTarget:self action:@selector(actionlike:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonstar = buttonstar;
    
    UIButton *buttonshare = [[UIButton alloc] init];
    [buttonshare setImage:[[UIImage imageNamed:@"share"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonshare setImage:[[UIImage imageNamed:@"share"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonshare.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonshare.imageView setTintColor:[UIColor whiteColor]];
    [buttonshare setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonshare addTarget:self action:@selector(actionshare:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    [self addSubview:buttonstar];
    [self addSubview:buttonshare];
    
    NSDictionary *views = @{@"button":button, @"buttonstar":buttonstar, @"buttonshare":buttonshare};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonstar(52)]-6-[buttonshare(52)]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[button(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-18-[buttonstar(44)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonshare(40)]" options:0 metrics:metrics views:views]];
    [self changestar];
    
    return self;
}

#pragma mark action

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

-(void)actionshare:(UIButton*)button
{
    
}

-(void)actionlike:(UIButton*)button
{
    [button setUserInteractionEnabled:NO];
    
    __weak typeof(self) weakself = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       item_status newstatus;
                       
                       if(weakself.controller.item.status == item_status_like)
                       {
                           newstatus = item_status_none;
                       }
                       else
                       {
                           newstatus = item_status_like;
                       }
                       
                       [weakself.controller.item changestatus:newstatus];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [weakself changestar];
                                          [button setUserInteractionEnabled:YES];
                                      });
                   });
    
    
}

#pragma mark functionality

-(void)changestar
{
    if(self.controller.item.status == item_status_like)
    {
        [self.buttonstar.imageView setTintColor:colorsecond];
    }
    else
    {
        [self.buttonstar.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.5]];
    }
}

@end