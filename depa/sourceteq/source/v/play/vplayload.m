#import "vplayload.h"

@implementation vplayload

-(instancetype)init:(cplayload*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    [self addSubview:spinner];

    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:NSLocalizedString(@"play_load_retrylabel", nil)];
    [label setHidden:YES];
    self.label = label;
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:colormain];
    [button setClipsToBounds:YES];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"play_load_retrybutton", nil) forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [button.layer setCornerRadius:4];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setHidden:YES];
    [button addTarget:self action:@selector(actionretry:) forControlEvents:UIControlEventTouchUpInside];
    self.button = button;
    
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"spinner":spinner, @"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    self.constraint = [NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:1];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[spinner(80)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[label]-20-[button(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[button]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.constraint];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat height = self.bounds.size.height - 80;
    CGFloat margin = height / 2.0;
    self.constraint.constant = margin;
    
    [super layoutSubviews];
}

#pragma mark actions

-(void)actionretry:(UIButton*)button
{
    [(cplayload*)self.controller recall];
}

#pragma mark public

-(void)showretry
{
    [self.spinner stopAnimating];
    [self.label setHidden:NO];
    [self.button setHidden:NO];
}

-(void)showloading
{
    [self.label setHidden:YES];
    [self.button setHidden:YES];
    [self.spinner startAnimating];
}

@end