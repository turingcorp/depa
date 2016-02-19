#import "vplay.h"

@implementation vplay

-(instancetype)init:(cplayitem*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:controller.item.itemtitle];
    [label setFont:[UIFont fontWithName:fontname size:17]];
    [label setNumberOfLines:0];
    [label setTextColor:[UIColor blackColor]];

    vplaymenu *menu = [[vplaymenu alloc] init];
    self.menu = menu;
    
    [self addSubview:label];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"label":label, @"menu":menu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-110-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(100)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end