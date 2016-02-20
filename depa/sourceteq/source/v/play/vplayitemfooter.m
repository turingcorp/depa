#import "vplayitemfooter.h"

@implementation vplayitemfooter

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];

    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    [label setTextColor:[UIColor blackColor]];
    [label setText:model.itemtitle];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end