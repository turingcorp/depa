#import "vitemcel.h"

@implementation vitemcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(void)config:(UIView*)overview
{
    [self.overview removeFromSuperview];
    self.overview = overview;
    [self addSubview:overview];
    
    NSDictionary *views = @{@"overview":overview};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[overview]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[overview]-0-|" options:0 metrics:metrics views:views]];
}

@end