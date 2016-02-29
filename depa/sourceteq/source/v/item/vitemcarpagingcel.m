#import "vitemcarpagingcel.h"

@implementation vitemcarpagingcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *circle = [[UIView alloc] init];
    [circle setClipsToBounds:YES];
    [circle.layer setCornerRadius:2];
    [circle.layer setBorderWidth:1];
    [circle.layer setBorderColor:[UIColor colorWithWhite:0.8 alpha:1].CGColor];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.circle = circle;
    
    [self addSubview:circle];
    [self hover];
    
    NSDictionary *views = @{@"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[circle]-1-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[circle]-1-|" options:0 metrics:metrics views:views]];
    
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
        [self.circle setBackgroundColor:[UIColor whiteColor]];
    }
    else
    {
        [self.circle setBackgroundColor:[UIColor clearColor]];
    }
}

@end