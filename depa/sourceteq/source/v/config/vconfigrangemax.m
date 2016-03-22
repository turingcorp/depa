#import "vconfigrangemax.h"

@implementation vconfigrangemax

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UISwitch *check = [[UISwitch alloc] init];
    [check setTranslatesAutoresizingMaskIntoConstraints:NO];
    [check addTarget:self action:@selector(actioncheck:) forControlEvents:UIControlEventValueChanged];
    [check setOnTintColor:colormain];
    self.check = check;
    
    UILabel *labeldescr = [[UILabel alloc] init];
    [labeldescr setBackgroundColor:[UIColor clearColor]];
    [labeldescr setUserInteractionEnabled:NO];
    [labeldescr setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeldescr setFont:[UIFont fontWithName:fontname size:17]];
    [labeldescr setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [labeldescr setText:NSLocalizedString(@"config_rangemax_descr", nil)];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setFont:[UIFont fontWithName:fontname size:14]];
    [labeltitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labeltitle setText:NSLocalizedString(@"config_rangemax_title", nil)];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:labeltitle];
    [self addSubview:labeldescr];
    [self addSubview:check];
    
    NSDictionary *views = @{@"check":check, @"labeldescr":labeldescr, @"labeltitle":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[check]-10-[labeldescr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-51-[check]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-54-[labeldescr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[labeltitle(16)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actioncheck:(UISwitch*)check
{
    
}



#pragma mark -
#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
}

@end