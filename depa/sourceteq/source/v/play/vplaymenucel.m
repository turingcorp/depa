#import "vplaymenucel.h"

@implementation vplaymenucel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    vblur *blur = [vblur light:YES];
    self.blur = blur;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    [self addSubview:blur];
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image, @"blur":blur};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[image]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[image]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[blur]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[blur]-40-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)addradius
{
    CGFloat blurwidth = self.blur.bounds.size.width;
    CGFloat radius = blurwidth / 2.0;
    [self.blur.layer setCornerRadius:radius];
}

#pragma mark public

-(void)config:(id<mplaymenuprotocol>)model
{
    [self.image setImage:[UIImage imageNamed:[model assetname]]];
    [self addradius];
}

@end