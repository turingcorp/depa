#import "vconfigcel.h"

@implementation vconfigcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
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
        [self setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
    }
    else
    {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark public

-(void)config:(UIView*)view
{
    [self.overview removeFromSuperview];
    self.overview = view;
    [self addSubview:view];
    
    NSDictionary *views = @{@"over":view};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[over]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[over]-0-|" options:0 metrics:metrics views:views]];
}

@end