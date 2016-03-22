#import "vplayitembutton.h"

@implementation vplayitembutton

-(instancetype)init:(vplayitem*)item
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    self.item = item;
    
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
        [self.item.image setAlpha:0.6];
    }
    else
    {
        [self.item.image setAlpha:1];
    }
}

@end