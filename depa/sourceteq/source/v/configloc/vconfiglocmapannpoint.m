#import "vconfiglocmapannpoint.h"

static const NSUInteger squaremargin = 6;
static const NSUInteger sidewidth = 8;

@implementation vconfiglocmapannpoint

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *square = [[UIView alloc] init];
    [square setClipsToBounds:YES];
    [square setUserInteractionEnabled:NO];
    [square setBackgroundColor:[colormain colorWithAlphaComponent:0.5]];
    [square setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *left = [[UIView alloc] init];
    [left setClipsToBounds:YES];
    [left setUserInteractionEnabled:NO];
    [left setBackgroundColor:colorsecond];
    [left setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *right = [[UIView alloc] init];
    [right setClipsToBounds:YES];
    [right setUserInteractionEnabled:NO];
    [right setBackgroundColor:colorsecond];
    [right setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:square];
    [self addSubview:left];
    [self addSubview:right];
    
    NSDictionary *views = @{@"square":square, @"left":left, @"right":right};
    NSDictionary *metrics = @{@"margin":@(squaremargin), @"width":@(sidewidth), @"sidemargin":@(squaremargin - (sidewidth / 2.0))};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[square]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[square]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(sidemargin)-[left(width)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[left(width)]-(sidemargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[right(width)]-(sidemargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(sidemargin)-[right(width)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end