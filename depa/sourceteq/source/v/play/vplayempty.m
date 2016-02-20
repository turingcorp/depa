#import "vplayempty.h"

@implementation vplayempty

-(instancetype)init:(cplayempty*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:18]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [label setText:NSLocalizedString(@"", nil)];
    
    return self;
}

@end