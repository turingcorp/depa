#import "vitemcontactview.h"

@implementation vitemcontactview

-(instancetype)init:(citemcontact*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.controllercontact = controller;
    
    NSString *phone = controller.item.contactphone;
    
    if(!phone)
    {
        phone = NSLocalizedString(@"item_detail_contact_nophone", nil);
    }
    
    vblur *blur = [vblur light:YES];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setImage:[[UIImage imageNamed:@"contact"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icon setTintColor:colormain];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:22]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [label setNumberOfLines:0];
    [label setText:phone];
    
    UIButton *btnclose = [[UIButton alloc] init];
    [btnclose setBackgroundColor:[UIColor colorWithRed:1 green:0.1 blue:0 alpha:1]];
    [btnclose setTitle:NSLocalizedString(@"item_detail_contact_close", nil) forState:UIControlStateNormal];
    [btnclose setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnclose setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [btnclose setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnclose setClipsToBounds:YES];
    [btnclose.layer setCornerRadius:4];
    [btnclose.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [btnclose addTarget:self action:@selector(actionclose:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnbrowse = [[UIButton alloc] init];
    [btnbrowse setBackgroundColor:colormain];
    [btnbrowse setTitle:NSLocalizedString(@"item_detail_contact_browse", nil) forState:UIControlStateNormal];
    [btnbrowse setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnbrowse setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [btnbrowse setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnbrowse setClipsToBounds:YES];
    [btnbrowse.layer setCornerRadius:4];
    [btnbrowse.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [btnbrowse addTarget:self action:@selector(actionbrowse:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btncall = [[UIButton alloc] init];
    [btncall setBackgroundColor:colormain];
    [btncall setTitle:NSLocalizedString(@"item_detail_contact_call", nil) forState:UIControlStateNormal];
    [btncall setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btncall setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [btncall setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btncall setClipsToBounds:YES];
    [btncall.layer setCornerRadius:4];
    [btncall.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [btncall addTarget:self action:@selector(actioncall:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:blur];
    [self addSubview:icon];
    [self addSubview:label];
    [self addSubview:btnclose];
    [self addSubview:btnbrowse];
    [self addSubview:btncall];
    
    if(!controller.item.contactphone)
    {
        [btncall setHidden:YES];
    }
    
    NSDictionary *views = @{@"blur":blur, @"icon":icon, @"label":label, @"close":btnclose, @"browse":btnbrowse, @"call":btncall};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[icon(50)]-50-[label]-20-[call(40)]-20-[browse(40)]-40-[close(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[close]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[browse]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[call]-80-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionclose:(UIButton*)button
{
    [self.controllercontact close];
}

-(void)actionbrowse:(UIButton*)button
{
    [self.controllercontact browse];
}

-(void)actioncall:(UIButton*)button
{
    [self.controllercontact call];
}

@end