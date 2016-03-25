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
    [label setFont:[UIFont fontWithName:fontname size:17]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setTitleColor:colormain forState:UIControlStateNormal];
    [buttonback setTitleColor:[colormain colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    [buttonback.titleLabel setFont:[UIFont fontWithName:fontname size:16]];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonback = buttonback;
    
    UIButton *buttonsearch = [[UIButton alloc] init];
    [buttonsearch setClipsToBounds:YES];
    [buttonsearch setBackgroundColor:colormain];
    [buttonsearch setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonsearch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonsearch setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonsearch.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [buttonsearch.layer setCornerRadius:4];
    [buttonsearch addTarget:self action:@selector(actionaccept:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonsearch = buttonsearch;
    
    [self addSubview:label];
    [self addSubview:buttonback];
    [self addSubview:buttonsearch];
    
    NSDictionary *views = @{@"label":label, @"buttonback":buttonback, @"buttonsearch":buttonsearch};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[buttonback]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[buttonsearch]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonback(40)]-10-[buttonsearch(40)]-120-|" options:0 metrics:metrics views:views]];

    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self setUserInteractionEnabled:NO];
    [self.list back];
}

-(void)actionaccept:(UIButton*)button
{
    [self setUserInteractionEnabled:NO];
    [self.list accept];
}

#pragma mark public

-(void)config:(vconfigloclist*)list
{
    self.list = list;
    
    if(list.model.parent)
    {
        NSString *title = [NSString stringWithFormat:NSLocalizedString(@"config_location_list_current", nil), list.model.title];
        NSString *titleback = [NSString stringWithFormat:NSLocalizedString(@"config_location_list_back", nil), [list.model.parent.strategyinstance title]];
        
        [self.buttonsearch setTitle:title forState:UIControlStateNormal];
        [self.buttonback setTitle:titleback forState:UIControlStateNormal];
    }
    
    [self.label setText:[NSString stringWithFormat:NSLocalizedString(@"config_location_list_select", nil), [list.model.strategyinstance title]]];
    [self setUserInteractionEnabled:YES];
}

@end