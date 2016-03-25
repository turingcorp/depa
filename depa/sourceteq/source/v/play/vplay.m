#import "vplay.h"

static NSUInteger const menuheight = 100;

@implementation vplay

-(instancetype)init:(cplayitem*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vplayitem *item = [[vplayitem alloc] init:controller.item];
    self.item = item;

    vplaymenu *menu = [[vplaymenu alloc] init:controller];
    self.menu = menu;
    
    [self addSubview:item];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"item":item, @"menu":menu};
    NSDictionary *metrics = @{@"menuheight":@(menuheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[item]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[item]-0-[menu(menuheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end