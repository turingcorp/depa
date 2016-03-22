#import "vconfigitemlike.h"

@implementation vconfigitemlike

-(instancetype)init:(cconfigitemlike*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setImage:[[UIImage imageNamed:@"like"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTintColor:colorsecond];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:20]];
    [label setTextColor:[UIColor blackColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *info = [[UILabel alloc] init];
    [info setBackgroundColor:[UIColor clearColor]];
    [info setUserInteractionEnabled:NO];
    [info setTranslatesAutoresizingMaskIntoConstraints:NO];
    [info setFont:[UIFont fontWithName:fontname size:17]];
    [info setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [info setTextAlignment:NSTextAlignmentCenter];
    [info setNumberOfLines:0];
    [info setText:NSLocalizedString(@"config_item_like_info", nil)];
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:colormain];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"config_item_like_button", nil) forState:UIControlStateNormal];
    [button.layer setCornerRadius:4];
    [button addTarget:self action:@selector(actionclear:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonview = [[UIButton alloc] init];
    [buttonview setBackgroundColor:colorsecond];
    [buttonview setClipsToBounds:YES];
    [buttonview setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonview.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [buttonview setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonview setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonview setTitle:NSLocalizedString(@"config_item_like_buttonview", nil) forState:UIControlStateNormal];
    [buttonview.layer setCornerRadius:4];
    [buttonview addTarget:self action:@selector(actionview:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:info];
    [self addSubview:image];
    [self addSubview:button];
    [self addSubview:buttonview];
    
    NSDictionary *views = @{@"image":image, @"label":label, @"info":info, @"button":button, @"buttonview":buttonview};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[info]-30-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[button]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[buttonview]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[image(80)]-(-12)-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[info]-10-[button(40)]-20-[buttonview(40)]-90-|" options:0 metrics:metrics views:views]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSNumber *value = [mdb itemsfor:item_status_like];
                       NSString *valuestring = [[tools singleton] numbertostring:value];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [label setText:valuestring];
                                      });
                   });
    
    return self;
}

#pragma mark actions

-(void)actionclear:(UIButton*)button
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"config_item_like_alert_title", nil) message:NSLocalizedString(@"config_item_like_alert_message", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"config_item_alert_cancel", nil) otherButtonTitles:NSLocalizedString(@"config_item_alert_clear", nil), nil] show];
}

-(void)actionview:(UIButton*)button
{
    [[cmain singleton] popViewControllerAnimated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 500), dispatch_get_main_queue(),
                   ^
                   {
                       [[cmain singleton].pages openfavorites];
                   });
}

#pragma mark functionality

-(void)clearlist
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [mdb clear:item_status_like];
                       [[analytics singleton] trackevent:ga_event_clear action:ga_action_list label:nil];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [[cmain singleton] popToRootViewControllerAnimated:YES];
                                      });
                   });
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    if(index)
    {
        [self clearlist];
    }
}

@end