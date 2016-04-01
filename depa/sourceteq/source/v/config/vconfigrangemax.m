#import "vconfigrangemax.h"

static CGFloat const secondsbeforesave = 6;

@implementation vconfigrangemax

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
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
    [slider setMaximumTrackTintColor:[UIColor colorWithWhite:0 alpha:0.15]];
    [slider setContinuous:YES];
    [slider addTarget:self action:@selector(actionslider:) forControlEvents:UIControlEventValueChanged];
    self.slider = slider;
    
    [self addSubview:labeltitle];
    [self addSubview:labeldescr];
    [self addSubview:label];
    [self addSubview:check];
    [self addSubview:slider];
    
    NSDictionary *views = @{@"check":check, @"labeldescr":labeldescr, @"labeltitle":labeltitle, @"slider":slider, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[check]-10-[labeldescr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-51-[check]-20-[label(25)]-0-[slider]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-54-[labeldescr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[slider]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[labeltitle(16)]" options:0 metrics:metrics views:views]];
 
    [self updaterange];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedpriceminchanged:) name:notminpricechanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedsearchmodechanged:) name:notsearchmodechanged object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark notified

-(void)notifiedpriceminchanged:(NSNotification*)notification
{
    __weak typeof(self) weakself = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [weakself updaterange];
                   });
}

-(void)notifiedsearchmodechanged:(NSNotification*)notification
{
    __weak typeof(self) weakself = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [weakself updaterange];
                   });
}

#pragma mark actions

-(void)actionslider:(UISlider*)slider
{
    self.currentprice = slider.value;
    [self print];
    [self save];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notmaxpricechanged object:nil];
}

-(void)actioncheck:(UISwitch*)check
{
    if(check.isOn)
    {
        self.currentprice = 0;
        [self.slider setValue:[[msettings singleton].searchmode pricemax] animated:NO];
        [self slideravailable:NO];
    }
    else
    {
        self.currentprice = self.slider.value;
        [self slideravailable:YES];
    }
    
    [self print];
    [self save];
}

#pragma mark functionality

-(void)savechange
{
    NSString *maxstr = [NSString stringWithFormat:@"%@", @(self.currentprice)];
    [[analytics singleton] trackevent:ga_event_config_maxprice action:ga_action_change label:maxstr];
}

-(void)tick:(NSTimer*)timer
{
    [timer invalidate];
    timer = nil;
    
    [self savechange];
}

-(void)save
{
    [msettings singleton].maxprice = self.currentprice;
    [[msettings singleton] save];
    
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:secondsbeforesave target:self selector:@selector(tick:) userInfo:nil repeats:NO];
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
        [self.slider setAlpha:0.2];
        [self.slider setValue:[[msettings singleton].searchmode pricemax] animated:NO];
        [self.label setAlpha:0.2];
    }
}

-(void)updaterange
{
    [self.slider setMaximumValue:[[msettings singleton].searchmode pricemax]];
    
    self.currentprice = [msettings singleton].maxprice;
    [self bounceminprice];
    
    if(self.currentprice)
    {
        [self slideravailable:YES];
    }
    else
    {
        [self slideravailable:NO];
    }
    
    [self print];
}

-(void)bounceminprice
{
    NSUInteger minprice = [msettings singleton].minprice;
    
    if(minprice)
    {
        [self.slider setMinimumValue:minprice];
        
        if(self.currentprice)
        {
            if(minprice > self.currentprice)
            {
                self.currentprice = minprice;
                [self.slider setValue:self.currentprice animated:NO];
            }
        }
    }
    else
    {
        [self.slider setMinimumValue:[[msettings singleton].searchmode pricemaxmin]];
    }
}

#pragma mark -
#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
}

@end