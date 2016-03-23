#import "vitemcar.h"

@implementation vitemcar

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    self.controller = controller;
    self.currentindex = 0;
    
    vitemcarcel *cellcurrent = [[vitemcarcel alloc] init];
    self.cellcurrent = cellcurrent;
    
    vitemcarcel *cellnext = [[vitemcarcel alloc] init];
    self.cellnext = cellnext;
    
    [self addSubview:cellcurrent];
    [self addSubview:cellnext];
    
    NSDictionary *views = @{@"cellcurrent":cellcurrent, @"cellnext":cellnext};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cellcurrent]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cellcurrent]-1-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cellnext]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cellnext]-1-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)loadimages
{
    [self.cellcurrent config:self.currentimage];
    [self.cellnext config:self.nextimage];
}

#pragma mark public

-(void)refresh
{
    if(self.controller.item.images.items.count)
    {
        self.currentindex = 0;
        self.currentimage = self.controller.item.images.items[self.currentindex];
        self.nextimage = nil;
        
        [self loadimages];
    }
}

#pragma mark -

@end