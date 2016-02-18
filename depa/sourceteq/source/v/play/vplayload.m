#import "vplayload.h"

@implementation vplayload

-(instancetype)init:(cplayload*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vspinner *spinner = [[vspinner alloc] init];
    [self addSubview:spinner];
    [spinner startAnimating];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    self.constraint = [NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:1];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[spinner(80)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.constraint];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat height = self.bounds.size.height - 80;
    CGFloat margin = height / 2.0;
    self.constraint.constant = margin;
    
    [super layoutSubviews];
}

@end