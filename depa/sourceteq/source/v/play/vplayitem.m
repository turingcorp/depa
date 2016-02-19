#import "vplayitem.h"

@implementation vplayitem

-(instancetype)init:(cplayitem*)controller
{
    self = [super init:controller];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    
    UIImageView *image = [[UIImageView alloc] init];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    [label setText:controller.item.itemtitle];
    [label setTextColor:[UIColor blackColor]];
    
    UIView *titlebase = [[UIView alloc] init];
    [titlebase setUserInteractionEnabled:NO];
    [titlebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titlebase setBackgroundColor:[UIColor whiteColor]];
    [titlebase setClipsToBounds:YES];
    [titlebase.layer setCornerRadius:2];
    
    [titlebase addSubview:label];
    [self addSubview:image];
    [self addSubview:titlebase];
    
    NSDictionary *views = @{@"image":image, @"label":label, @"titlebase":titlebase};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[titlebase]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titlebase(40)]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end