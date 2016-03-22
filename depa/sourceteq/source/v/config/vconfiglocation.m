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
    self.labellocation = labellocation;
    
    UILabel *change = [[UILabel alloc] init];
    [change setBackgroundColor:[UIColor clearColor]];
    [change setUserInteractionEnabled:NO];
    [change setFont:[UIFont fontWithName:fontboldname size:16]];
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
    
    UIView *selector = [[UIView alloc] init];
    [selector setUserInteractionEnabled:NO];
    [selector setTranslatesAutoresizingMaskIntoConstraints:NO];
    [selector setClipsToBounds:YES];
    [selector.layer setCornerRadius:4];
    self.selector = selector;
    
    [self addSubview:selector];
    [self addSubview:border];
    [self addSubview:change];
    [self addSubview:label];
    [self addSubview:labellocation];

    NSDictionary *views = @{@"label":label, @"location":labellocation, @"change":change, @"border":border, @"selector":selector};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[change]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[border]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[location]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[label(16)]-30-[location]-3-[border(1)]-3-[change]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[selector]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-48-[selector]-20-|" options:0 metrics:metrics views:views]];
    
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
        [self.selector setBackgroundColor:colormain];
    }
    else
    {
        [self.labellocation setTextColor:colormain];
        [self.border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
        [self.change setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [self.selector setBackgroundColor:[UIColor whiteColor]];
    }
}

@end