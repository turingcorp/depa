#import "vconfiglocmapannpoint.h"

static const NSUInteger squaremargin = 12;
static const NSUInteger sidewidth = 14;

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
    [square setBackgroundColor:[colorsecond colorWithAlphaComponent:0.25]];
    [square setTranslatesAutoresizingMaskIntoConstraints:NO];
    [square.layer setBorderWidth:1];
    [square.layer setBorderColor:[colorsecond colorWithAlphaComponent:0.3].CGColor];
    
    UIView *left = [[UIView alloc] init];
    [left setClipsToBounds:YES];
    [left setUserInteractionEnabled:NO];
    [left setBackgroundColor:[UIColor colorWithRed:0.4 green:0.7 blue:0.8 alpha:1]];
    [left setTranslatesAutoresizingMaskIntoConstraints:NO];
    [left.layer setBorderWidth:1];
    [left.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.1].CGColor];
    
    UIView *right = [[UIView alloc] init];
    [right setClipsToBounds:YES];
    [right setUserInteractionEnabled:NO];
    [right setBackgroundColor:[UIColor colorWithRed:0.4 green:0.7 blue:0.8 alpha:1]];
    [right setTranslatesAutoresizingMaskIntoConstraints:NO];
    [right.layer setBorderWidth:1];
    [right.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.1].CGColor];
    
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