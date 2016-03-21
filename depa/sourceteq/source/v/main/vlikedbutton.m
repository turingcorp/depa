#import "vlikedbutton.h"

@implementation vlikedbutton

-(instancetype)init:(cpages*)pages
{
    self = [super initWithFrame:CGRectMake(0, 0, 80, 40)];
    [self setClipsToBounds:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self addTarget:pages action:@selector(openfavorites) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setImage:[[UIImage imageNamed:@"liked"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    vbadge *badge = [[vbadge alloc] init];
    
    [self addSubview:image];
    [self addSubview:badge];
    
    NSDictionary *views = @{@"image":image, @"badge":badge};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[image]-(-20)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[badge(25)]-6-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[badge(25)]-4-|" options:0 metrics:metrics views:views]];
    
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
        [self.image setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    }
    else
    {
        [self.image setTintColor:[UIColor whiteColor]];
    }
}

@end