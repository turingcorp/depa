#import "vspinner.h"

@implementation vspinner

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.95]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIActivityIndicatorView *spin = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spin setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.spin = spin;
    
    [self addSubview:spin];
    
    NSDictionary *views = @{@"spin":spin};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spin]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[spin]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)stop
{
    [self.spin stopAnimating];
}

-(void)start
{
    [self.spin startAnimating];
}

@end