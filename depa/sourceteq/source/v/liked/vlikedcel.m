#import "vlikedcel.h"

@implementation vlikedcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *basegeneral = [[UIView alloc] init];
    [basegeneral setClipsToBounds:YES];
    [basegeneral setUserInteractionEnabled:NO];
    [basegeneral setTranslatesAutoresizingMaskIntoConstraints:NO];
    [basegeneral.layer setCornerRadius:5];
    self.basegeneral = basegeneral;
    
    UIView *baseimage = [[UIView alloc] init];
    [baseimage setClipsToBounds:YES];
    [baseimage setUserInteractionEnabled:NO];
    [baseimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [baseimage setBackgroundColor:[UIColor colorWithWhite:0.94 alpha:1]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    self.label = label;
    
    [self addSubview:basegeneral];
    [self addSubview:baseimage];
    [self addSubview:label];
    
    NSDictionary *views = @{@"basegeneral":basegeneral, @"label":label, @"base":baseimage};
    NSDictionary *metrics = @{@"imageheight":@(vlikedcellimageheight), @"spacing":@(vlikedcellspacing), @"hrpadding":@(vlikedcellhrpadding), @"bottompadding":@(vlikedcellbottompadding)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[basegeneral]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[basegeneral]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[base]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[base(imageheight)]-(spacing)-[label]-(bottompadding)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hrpadding)-[label]-(hrpadding)-|" options:0 metrics:metrics views:views]];
    
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
        [self.basegeneral setBackgroundColor:[UIColor colorWithWhite:0.92 alpha:1]];
        [self.label setTextColor:colormain];
    }
    else
    {
        [self.basegeneral setBackgroundColor:[UIColor whiteColor]];
        [self.label setTextColor:colorsecond];
    }
}

#pragma mark public

-(void)config:(mlikeditem*)item
{
    self.item = item;
    [self.label setAttributedText:item.display];
    [self hover];
}

@end