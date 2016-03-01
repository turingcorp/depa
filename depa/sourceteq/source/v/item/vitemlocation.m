#import "vitemlocation.h"

@implementation vitemlocation

-(instancetype)init:(citemlocation*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vblur *blur = [vblur light:YES];
    
    vitemlocationmenu *menu = [[vitemlocationmenu alloc] init:controller];
    self.menu = menu;
    
    [self addSubview:blur];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"blur":blur, @"menu":menu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[menu(65)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end