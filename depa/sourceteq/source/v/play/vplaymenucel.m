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
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[image]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[image]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[blur]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[blur]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat blurwidth = self.blur.bounds.size.width;
    CGFloat radius = blurwidth / 2.0;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.blur.layer setCornerRadius:radius];
                   });
    
    [super layoutSubviews];
}

#pragma mark public

-(void)config:(id<mplaymenuprotocol>)model
{
    [self.image setImage:[UIImage imageNamed:[model assetname]]];
}

@end