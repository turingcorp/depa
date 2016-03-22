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
    [label setFont:[UIFont fontWithName:fontname size:14]];
    [label setText:NSLocalizedString(@"config_location_title", nil)];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *labellocation = [[UILabel alloc] init];
    [labellocation setBackgroundColor:[UIColor clearColor]];
    [labellocation setFont:[UIFont fontWithName:fontboldname size:16]];
    [labellocation setUserInteractionEnabled:NO];
    [labellocation setTextAlignment:NSTextAlignmentCenter];
    [labellocation setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labellocation setText:[msettings singleton].locationname];
    [labellocation setTextAlignment:NSTextAlignmentRight];
    self.labellocation = labellocation;
    
    UILabel *change = [[UILabel alloc] init];
    [change setBackgroundColor:[UIColor clearColor]];
    [change setUserInteractionEnabled:NO];
    [change setFont:[UIFont fontWithName:fontboldname size:15]];
    [change setUserInteractionEnabled:NO];
    [change setTranslatesAutoresizingMaskIntoConstraints:NO];
    [change setTextAlignment:NSTextAlignmentCenter];
    [change setText:NSLocalizedString(@"config_location_change", nil)];
    self.change = change;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.border = border;
    
    [self addSubview:border];
    [self addSubview:change];
    [self addSubview:label];
    [self addSubview:labellocation];

    NSDictionary *views = @{@"label":label, @"location":labellocation, @"change":change, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[change]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[border]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[location]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[label(16)]-15-[location]-2-[border(1)]-2-[change]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
    if(hover)
    {
        [self.labellocation setTextColor:[UIColor whiteColor]];
        [self.border setBackgroundColor:[UIColor whiteColor]];
        [self.change setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self.labellocation setTextColor:colormain];
        [self.border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
        [self.change setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    }
}

@end