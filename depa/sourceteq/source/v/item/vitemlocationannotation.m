#import "vitemlocationannotation.h"

static CGFloat const annsize = 80;

@implementation vitemlocationannotation

-(instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, annsize, annsize)];
    [self setClipsToBounds:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setImage:[UIImage imageNamed:@"ann"]];
    
    [self addSubview:image];
    
    CGFloat halfsize = annsize / 2.0;
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{@"half":@(halfsize), @"minushalf":@(-halfsize)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(minushalf)-[image]-(half)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end