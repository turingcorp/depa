#import "vconfigno.h"

static NSUInteger const labelwidth = 50;
static NSUInteger const iconwidth = 45;

@implementation vconfigno

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setClipsToBounds:YES];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setImage:[[UIImage imageNamed:@"no"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTintColor:colormain];
    self.icon = icon;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:18]];
    [label setTextColor:colormain];
    self.label = label;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setFont:[UIFont fontWithName:fontname size:14]];
    [labeltitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labeltitle setText:NSLocalizedString(@"config_no_title", nil)];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    
    UIView *selector = [[UIView alloc] init];
    [selector setUserInteractionEnabled:NO];
    [selector setTranslatesAutoresizingMaskIntoConstraints:NO];
    [selector setClipsToBounds:YES];
    [selector.layer setCornerRadius:4];
    self.selector = selector;
    
    [self addSubview:selector];
    [self addSubview:labeltitle];
    [self addSubview:label];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"icon":icon, @"label":label, @"labeltitle":labeltitle, @"selector":selector};
    NSDictionary *metrics = @{@"labelwidth":@(labelwidth), @"iconwidth":@(iconwidth)};
    
    self.layoutmarginleft = [NSLayoutConstraint constraintWithItem:icon attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(iconwidth)]-0-[label(labelwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[labeltitle(16)]-25-[icon(45)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[label(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[selector]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-48-[selector]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutmarginleft];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSNumber *value = [mdb itemsfor:item_status_no];
                       NSString *valuestring = [[tools singleton] numbertostring:value];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [label setText:valuestring];
                                      });
                   });
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat remain = width - (labelwidth + iconwidth);
    CGFloat margin = remain / 2.0;
    self.layoutmarginleft.constant = margin + 10;
    
    [super layoutSubviews];
}

#pragma mark -
#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
    if(hover)
    {
        [self.icon setTintColor:[UIColor whiteColor]];
        [self.label setTextColor:[UIColor whiteColor]];
        [self.selector setBackgroundColor:colormain];
    }
    else
    {
        [self.icon setTintColor:colormain];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [self.selector setBackgroundColor:[UIColor whiteColor]];
    }
}

@end