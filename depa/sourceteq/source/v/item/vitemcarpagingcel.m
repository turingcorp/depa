#import "vitemcarpagingcel.h"

@implementation vitemcarpagingcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *square = [[UIView alloc] init];
    [square setClipsToBounds:YES];
    [square.layer setCornerRadius:2];
    [square setUserInteractionEnabled:NO];
    [square setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.square = square;
    
    [self addSubview:square];
    [self hover];
    
    NSDictionary *views = @{@"square":square};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[square]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[square]-2-|" options:0 metrics:metrics views:views]];
    
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
        [self.square setBackgroundColor:colorsecond];
    }
    else
    {
        [self.square setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    }
}

@end