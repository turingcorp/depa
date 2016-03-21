#import "vlikedbutton.h"

@implementation vlikedbutton

-(instancetype)init:(cpages*)pages
{
    self = [super initWithFrame:CGRectMake(0, 0, 70, 40)];
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
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[image]-(-20)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
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