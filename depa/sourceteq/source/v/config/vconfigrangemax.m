#import "vconfigrangemax.h"

static NSUInteger const limitmaxprice = 2000;
static NSUInteger const limitmaxpricemax = 200000;

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
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:colormain];
    [label setFont:[UIFont fontWithName:fontboldname size:18]];
    self.label = label;
    
    UISlider *slider = [[UISlider alloc] init];
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [slider setMinimumTrackTintColor:colormain];
    [slider setMaximumTrackTintColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [slider setMaximumValue:limitmaxpricemax];
    [slider setContinuous:YES];
    self.slider = slider;
    
    [self addSubview:labeltitle];
    [self addSubview:labeldescr];
    [self addSubview:label];
    [self addSubview:check];
    [self addSubview:slider];
    
    NSDictionary *views = @{@"check":check, @"labeldescr":labeldescr, @"labeltitle":labeltitle, @"slider":slider, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[check]-10-[labeldescr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-51-[check]-10-[slider]-10-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-54-[labeldescr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[slider]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[labeltitle(16)]" options:0 metrics:metrics views:views]];
 
    [self updaterange];
    
    return self;
}

#pragma mark actions

-(void)actioncheck:(UISwitch*)check
{
    if(check.isOn)
    {
        self.currentprice = 0;
        [self.slider setValue:limitmaxpricemax animated:NO];
        [self slideravailable:NO];
    }
    else
    {
        self.currentprice = self.slider.value;
        [self slideravailable:YES];
    }
    
    [self save];
}

#pragma mark functionality

-(void)save
{
    [msettings singleton].maxprice = self.currentprice;
    [[msettings singleton] save];
}

-(void)print
{
    if(self.currentprice)
    {
        NSString *pricestring = [[tools singleton] pricetostring:@(self.currentprice) currency:@""];
        [self.label setText:pricestring];
    }
    else
    {
        [self.label setText:@""];
    }
}

-(void)slideravailable:(BOOL)available
{
    if(available)
    {
        [self.check setOn:NO];
        [self.slider setUserInteractionEnabled:YES];
        [self.slider setAlpha:1];
        [self.slider setValue:self.currentprice animated:NO];
        [self.label setAlpha:1];
    }
    else
    {
        [self.check setOn:YES];
        [self.slider setUserInteractionEnabled:NO];
        [self.slider setAlpha:0.4];
        [self.slider setValue:limitmaxprice animated:NO];
        [self.label setAlpha:0.2];
    }
}

-(void)updaterange
{
    self.currentprice = [msettings singleton].maxprice;
    NSUInteger minprice = [msettings singleton].minprice;
    
    if(self.currentprice)
    {
        [self slideravailable:YES];
    }
    else
    {
        [self slideravailable:NO];
    }
    
    if(minprice)
    {
        [self.slider setMinimumValue:minprice];
    }
    else
    {
        [self.slider setMinimumValue:limitmaxprice];
    }
    
    [self print];
}

#pragma mark -
#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
}

@end