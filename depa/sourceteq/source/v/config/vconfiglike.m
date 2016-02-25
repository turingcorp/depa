#import "vconfiglike.h"

@implementation vconfiglike
{
    UIColor *color;
}

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    color = [UIColor colorWithRed:0.4 green:0.7 blue:0.8 alpha:1];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setClipsToBounds:YES];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setImage:[[UIImage imageNamed:@"like"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTintColor:color];
    self.icon = icon;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:22]];
    [label setTextColor:color];
    [label setTextAlignment:NSTextAlignmentRight];
    self.label = label;
    
    [self addSubview:label];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"icon":icon, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[label]-0-[icon(70)]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[icon]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *query = [NSString stringWithFormat:
                                          @"SELECT COUNT(id) FROM item where status=%@;",
                                          @(item_status_like)];
                       NSNumber *value = [db value:query];
                       NSString *valuestring = [[tools singleton] numbertostring:value];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [label setText:valuestring];
                                      });
                   });
    
    return self;
}

#pragma mark -
#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
    if(hover)
    {
        [self.icon setTintColor:[UIColor whiteColor]];
        [self.label setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self.icon setTintColor:color];
        [self.label setTextColor:color];
    }
}

@end