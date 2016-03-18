#import "vitemceladdressmarker.h"

static NSInteger const minselectormargin = 1;
static NSInteger const maxselectormargin = 30;

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
    self.image = image;
    
    UILabel *caption = [[UILabel alloc] init];
    [caption setBackgroundColor:[UIColor clearColor]];
    [caption setUserInteractionEnabled:NO];
    [caption setTextAlignment:NSTextAlignmentCenter];
    [caption setFont:[UIFont fontWithName:fontname size:13]];
    [caption setText:NSLocalizedString(@"item_detail_address_marker", nil)];
    [caption setTextColor:colormain];
    [caption setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.caption = caption;
    
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
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-35-[image]-(-10)-[caption(16)]-52-|" options:0 metrics:metrics views:views]];
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
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [weakself layoutIfNeeded];
         [self.image setAlpha:0.3];
         [self.caption setAlpha:0.3];
         [self.mapselector setAlpha:0.05];
     }];
}

-(void)hideselector
{
    [self.mapselector setHidden:YES];
    self.layoutselectortop.constant = minselectormargin;
    self.layoutselectorbottom.constant = -minselectormargin;
    
    [self.image setAlpha:1];
    [self.caption setAlpha:1];
    [self.mapselector setAlpha:1];
}

@end