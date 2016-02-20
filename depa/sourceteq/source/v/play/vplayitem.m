#import "vplayitem.h"

@implementation vplayitem

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];

    self.model = model;
    vplayitemheader *header = [[vplayitemheader alloc] init:model];
    vplayitemfooter *footer = [[vplayitemfooter alloc] init:model];
    vplayitemmiddle *middle = [[vplayitemmiddle alloc] init:model];
    vplayitemimage *image = [[vplayitemimage alloc] init:model];
    
    [self addSubview:image];
    [self addSubview:header];
    [self addSubview:middle];
    [self addSubview:footer];
    
    NSDictionary *views = @{@"image":image, @"header":header, @"footer":footer, @"middle":middle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[footer]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[middle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[header(30)]-0-[image]-5-[middle(40)]-5-[footer(65)]-5-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end