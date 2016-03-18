#import "vitemceladdressmarker.h"

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
    [image setTintColor:colorthird];
    [image setImage:[UIImage imageNamed:@"map"]];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *caption = [[UILabel alloc] init];
    [caption setBackgroundColor:[UIColor clearColor]];
    [caption setUserInteractionEnabled:NO];
    [caption setTextAlignment:NSTextAlignmentCenter];
    [caption setFont:[UIFont fontWithName:fontname size:13]];
    [caption setText:NSLocalizedString(@"item_detail_address_marker", nil)];
    [caption setTextColor:colorthird];
    [caption setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:caption];
    [self addSubview:image];
    
    NSDictionary *views = @{@"caption":caption, @"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[caption]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[image]-(-5)-[caption]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end