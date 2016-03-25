#import "vconfigcel.h"

@implementation vconfigcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
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
    BOOL hover = self.isSelected || self.isHighlighted;
    [self.overview hover:hover];
}

#pragma mark public

-(void)config:(UIView<vconfigcelprotocol>*)view
{
    [self.overview removeFromSuperview];
    self.overview = view;
    [self addSubview:view];
    
    NSDictionary *views = @{@"over":view};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[over]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[over]-0-|" options:0 metrics:metrics views:views]];
    [self hover];
}

@end