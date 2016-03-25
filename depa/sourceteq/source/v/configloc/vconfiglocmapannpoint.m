#import "vconfiglocmapannpoint.h"

static const NSUInteger sidewidth = 14;

@implementation vconfiglocmapannpoint

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *square = [[UIView alloc] init];
    [square setClipsToBounds:YES];
    [square setUserInteractionEnabled:NO];
    [square setBackgroundColor:[colorsecond colorWithAlphaComponent:0.25]];
    [square setTranslatesAutoresizingMaskIntoConstraints:NO];
    [square.layer setBorderWidth:1];
    [square.layer setBorderColor:[colorsecond colorWithAlphaComponent:0.3].CGColor];
    
    UIView *left = [[UIView alloc] init];
    [left setClipsToBounds:YES];
    [left setUserInteractionEnabled:NO];
    [left setBackgroundColor:colormain];
    [left setTranslatesAutoresizingMaskIntoConstraints:NO];
    [left.layer setBorderWidth:1];
    [left.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.1].CGColor];
    
    UIView *right = [[UIView alloc] init];
    [right setClipsToBounds:YES];
    [right setUserInteractionEnabled:NO];
    [right setBackgroundColor:colormain];
    [right setTranslatesAutoresizingMaskIntoConstraints:NO];
    [right.layer setBorderWidth:1];
    [right.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.1].CGColor];
    
    [self addSubview:square];
    [self addSubview:left];
    [self addSubview:right];
    
    NSDictionary *views = @{@"square":square, @"left":left, @"right":right};
    NSDictionary *metrics = @{@"width":@(sidewidth), @"sidemargin":@(sidewidth / 2.0)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(sidemargin)-[square]-(sidemargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(sidemargin)-[square]-(sidemargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[left(width)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[left(width)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[right(width)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[right(width)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end