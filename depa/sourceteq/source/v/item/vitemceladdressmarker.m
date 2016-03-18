#import "vitemceladdressmarker.h"

static NSUInteger const minselectormargin = 2;
static NSUInteger const maxselectormargin = 30;

@implementation vitemceladdressmarker

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setTintColor:colormain];
    [image setImage:[[UIImage imageNamed:@"map"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *caption = [[UILabel alloc] init];
    [caption setBackgroundColor:[UIColor clearColor]];
    [caption setUserInteractionEnabled:NO];
    [caption setTextAlignment:NSTextAlignmentCenter];
    [caption setFont:[UIFont fontWithName:fontname size:13]];
    [caption setText:NSLocalizedString(@"item_detail_address_marker", nil)];
    [caption setTextColor:colormain];
    [caption setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *mapselector = [[UIImageView alloc] init];
    [mapselector setClipsToBounds:YES];
    [mapselector setContentMode:UIViewContentModeScaleAspectFit];
    [mapselector setUserInteractionEnabled:NO];
    [mapselector setTranslatesAutoresizingMaskIntoConstraints:NO];
    [mapselector setTintColor:colormain];
    [mapselector setImage:[[UIImage imageNamed:@"mapselector"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.mapselector = mapselector;
    
    [self addSubview:caption];
    [self addSubview:image];
    [self addSubview:mapselector];
    
    NSDictionary *views = @{@"caption":caption, @"image":image, @"mapselector":mapselector};
    NSDictionary *metrics = @{};
    
    self.layoutselectortop = [NSLayoutConstraint constraintWithItem:mapselector attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:minselectormargin];
    self.layoutselectorbottom = [NSLayoutConstraint constraintWithItem:mapselector attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-minselectormargin];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[caption]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[mapselector]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[image]-(-5)-[caption(16)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutselectortop];
    [self addConstraint:self.layoutselectorbottom];
    [self hover];
    
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
        [self showselector];
    }
    else
    {
        [self hideselector];
    }
}

-(void)showselector
{
    [self.mapselector setHidden:NO];
    
    self.layoutselectortop.constant = maxselectormargin;
    self.layoutselectorbottom.constant = -maxselectormargin;
    __weak typeof(self) weakself = self;
    
    [UIView animateWithDuration:1 animations:
     ^
     {
         [weakself layoutIfNeeded];
     }];
}

-(void)hideselector
{
    [self.mapselector setHidden:YES];
    self.layoutselectortop.constant = minselectormargin;
    self.layoutselectorbottom.constant = -minselectormargin;
}

@end