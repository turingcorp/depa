#import "vplayitem.h"

static NSUInteger const infoheight = 150;

@implementation vplayitem

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    self.model = model;
    vplayitemheader *header = [[vplayitemheader alloc] init:model];
    vplayitemimage *image = [[vplayitemimage alloc] init:model];
    vplayiteminfo *info = [[vplayiteminfo alloc] init:model];
    self.image = image;
    
    vplayitembutton *button = [[vplayitembutton alloc] init];
    [button addTarget:self action:@selector(actiondetail:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:image];
    [self addSubview:header];
    [self addSubview:info];
    [self addSubview:button];
    
    NSDictionary *views = @{@"image":image, @"header":header, @"info":info, @"button":button};
    NSDictionary *metrics = @{@"infoheight":@(infoheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[info]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[header(20)]-0-[image]-0-[info(infoheight)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actiondetail:(UIButton*)button
{
    mitemdetail *itemdetail = [[mitemdetail alloc] init:self.model.item.itemid];
    itemdetail.type = [[msettings singleton].searchtype type];
    itemdetail.mode = [[msettings singleton].searchmode type];
    itemdetail.contactphone = self.model.phone;
    [citem show:itemdetail];
}

@end