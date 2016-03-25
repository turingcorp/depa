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
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-20-|" options:0 metrics:metrics views:views]];
    
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
//        [self.labelcurrent setText:title];
    }
    
    [self.label setText:[NSString stringWithFormat:NSLocalizedString(@"config_location_list_select", nil), [list.model.strategyinstance title]]];
    [self setUserInteractionEnabled:YES];
}

@end