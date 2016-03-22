#import "vconfigmodecel.h"

@implementation vconfigmodecel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    UIView *selector = [[UIView alloc] init];
    [selector setUserInteractionEnabled:NO];
    [selector setTranslatesAutoresizingMaskIntoConstraints:NO];
    [selector setBackgroundColor:colormain];
    [selector setClipsToBounds:YES];
    [selector.layer setCornerRadius:4];
    self.selector = selector;
    
    [self addSubview:selector];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"selector":selector};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[selector]-1-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-13-[selector]-13-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.selector setHidden:NO];
        [self.label setTextColor:[UIColor whiteColor]];
        [self.label setFont:[UIFont fontWithName:fontboldname size:14]];
    }
    else
    {
        [self.selector setHidden:YES];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.65]];
        [self.label setFont:[UIFont fontWithName:fontname size:14]];
    }
}

#pragma mark public

-(void)config:(id<mconfigmodprotocol>)model
{
    [self.label setText:[model title]];
    [self hover];
}

@end