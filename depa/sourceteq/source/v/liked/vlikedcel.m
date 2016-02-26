#import "vlikedcel.h"

@implementation vlikedcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UIView *baseimage = [[UIView alloc] init];
    [baseimage setClipsToBounds:YES];
    [baseimage setUserInteractionEnabled:NO];
    [baseimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [baseimage setBackgroundColor:[UIColor colorWithWhite:0.94 alpha:1]];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setFont:[UIFont fontWithName:fontname size:14]];
    self.labeltitle = labeltitle;
    
    UILabel *labelprice = [[UILabel alloc] init];
    [labelprice setBackgroundColor:[UIColor clearColor]];
    [labelprice setUserInteractionEnabled:NO];
    [labelprice setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelprice setFont:[UIFont fontWithName:fontname size:14]];
    self.labelprice = labelprice;
    
    [self addSubview:baseimage];
    [self addSubview:labeltitle];
    [self addSubview:labelprice];
    
    NSDictionary *views = @{@"title":labeltitle, @"price":labelprice, @"base":baseimage};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[base(100)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[base]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-110-[price]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-110-[title]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[title]-5-[price]" options:0 metrics:metrics views:views]];
    
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
        [self setBackgroundColor:[UIColor colorWithWhite:0.92 alpha:1]];
        [self.labelprice setTextColor:colormain];
        [self.labeltitle setTextColor:colormain];
    }
    else
    {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.labelprice setTextColor:colorsecond];
        [self.labeltitle setTextColor:colorsecond];
    }
}

#pragma mark public

-(void)config:(mlikeditem*)item
{
    self.item = item;
    [self.labeltitle setText:item.title];
    [self.labelprice setText:[[tools singleton] pricetostring:item.price currency:item.currencyid]];
    [self hover];
}

@end