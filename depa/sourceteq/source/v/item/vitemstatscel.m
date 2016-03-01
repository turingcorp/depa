#import "vitemstatscel.h"

@implementation vitemstatscel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:fontname size:14]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(id<mitemdetailinfostatsprotocol>)model
{
    [self.label setText:[model title]];
}

@end