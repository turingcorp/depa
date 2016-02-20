#import "vplayitemmiddle.h"

@implementation vplayitemmiddle

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor whiteColor]];
    [label setUserInteractionEnabled:NO];
    [label setClipsToBounds:YES];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:16]];
    
    [self addSubview:label];
    
    return self;
}

@end