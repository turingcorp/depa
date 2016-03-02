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
    [label setFont:[UIFont fontWithName:fontname size:20]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [label setText:NSLocalizedString(@"play_empty", nil)];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setNumberOfLines:0];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setClipsToBounds:YES];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button setBackgroundColor:colormain];
    [button setTitle:NSLocalizedString(@"play_empty_button", nil) forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [button.layer setCornerRadius:4];
    [button addTarget:self action:@selector(actioneditfilters:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[label]-25-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[button]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[label]-20-[button(42)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actioneditfilters:(UIButton*)button
{
    [[cmain singleton].pages openconfig];
}

@end