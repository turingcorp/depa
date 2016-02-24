#import "vconfigloclistheader.h"

@implementation vconfigloclistheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:16]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    UILabel *labelcurrent = [[UILabel alloc] init];
    [labelcurrent setBackgroundColor:[UIColor clearColor]];
    [labelcurrent setUserInteractionEnabled:NO];
    [labelcurrent setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelcurrent setUserInteractionEnabled:NO];
    [labelcurrent setFont:[UIFont fontWithName:fontboldname size:16]];
    [labelcurrent setTextColor:colormain];
    [labelcurrent setTextAlignment:NSTextAlignmentCenter];
    self.labelcurrent = labelcurrent;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setClipsToBounds:YES];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonback.imageView setTintColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonaccept = [[UIButton alloc] init];
    [buttonaccept setClipsToBounds:YES];
    [buttonaccept setImage:[[UIImage imageNamed:@"accept"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonaccept setImage:[[UIImage imageNamed:@"accept"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonaccept.imageView setTintColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [buttonaccept.imageView setClipsToBounds:YES];
    [buttonaccept.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonaccept addTarget:self action:@selector(actionaccept:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat width = frame.size.width;
    CGFloat buttonswidth = 200;
    CGFloat margin = (width - buttonswidth) / 2.0;
    
    [self addSubview:label];
    [self addSubview:labelcurrent];
    [self addSubview:buttonback];
    [self addSubview:buttonaccept];
    
    NSDictionary *views = @{@"label":label, @"current":labelcurrent, @"back":buttonback, @"accept":buttonaccept};
    NSDictionary *metrics = @{@"margin":@(margin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-25-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[current]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[current]-180-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[back(90)]-0-[accept(90)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[accept(80)]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[back(80)]-100-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    
}

-(void)actionaccept:(UIButton*)button
{
    
}

#pragma mark public

-(void)config:(mconfigloclistitem*)model
{
    if(model.parent)
    {
        NSString *title = [NSString stringWithFormat:NSLocalizedString(@"config_location_list_current", nil), model.title];
        [self.labelcurrent setText:title];
    }
    
    [self.label setText:[NSString stringWithFormat:NSLocalizedString(@"config_location_list_select", nil), [model.strategyinstance title]]];
}

@end