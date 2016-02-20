#import "vplayempty.h"

@implementation vplayempty

-(instancetype)init:(cplayempty*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:18]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [label setText:NSLocalizedString(@"play_empty", nil)];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setClipsToBounds:YES];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button setBackgroundColor:colormain];
    [button setTitle:NSLocalizedString(@"play_empty_button", nil) forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:14]];
    [button.layer setCornerRadius:4];
    
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[button]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[label]-10-[button(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end