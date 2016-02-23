#import "vconfiglocation.h"

@implementation vconfiglocation

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:16]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [label setText:NSLocalizedString(@"config_location_title", nil)];
    
    UILabel *labellocation = [[UILabel alloc] init];
    [labellocation setBackgroundColor:[UIColor clearColor]];
    [labellocation setFont:[UIFont fontWithName:fontname size:18]];
    [labellocation setTextColor:colormain];
    [labellocation setUserInteractionEnabled:NO];
    [labellocation setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labellocation setText:@"Distrito federal"];
    [labellocation setTextAlignment:NSTextAlignmentRight];
    self.labellocation = labellocation;
    
    [self addSubview:label];
    [self addSubview:labellocation];

    NSDictionary *views = @{@"label":label, @"location":labellocation};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[location]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[location]-18-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end