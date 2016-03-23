#import "vitemcar.h"

@implementation vitemcar
{
    CGPoint startingpoint;
    CGFloat initialoffsety;
    CGFloat newoffsety;
}

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
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
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cellcurrent]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cellcurrent]-1-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cellnext]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cellnext]-1-|" options:0 metrics:metrics views:views]];

    UIPanGestureRecognizer *pangesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(actionpanning:)];
    self.pangesture = pangesture;
    [self addGestureRecognizer:pangesture];
    
    return self;
}

#pragma mark actions

-(void)actionpanning:(UIPanGestureRecognizer*)panning
{
    CGPoint newpoint;
    
    switch(panning.state)
    {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStatePossible:
            
            if(!self.maincollection)
            {
                self.maincollection = ((vitem*)self.controller.view).collection;
            }
            
            startingpoint = [panning locationInView:self];
            initialoffsety = self.maincollection.contentOffset.y;
            
            break;
            
        case UIGestureRecognizerStateChanged:
            
            newpoint = [panning locationInView:self];
            [self movepan:newpoint];
            
            break;
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
            
            [self endedpanning];
            
            break;
    }
}

#pragma mark functionality

-(void)verticalpanning:(CGFloat)movey
{
    newoffsety = initialoffsety - movey;
    
    CGPoint newoffset = CGPointMake(0, newoffsety);
    [self.maincollection setContentOffset:newoffset animated:NO];
}

-(void)endedpanning
{
    if(newoffsety < 0)
    {
        [self.maincollection setContentOffset:CGPointZero animated:YES];
    }
}

-(void)movepan:(CGPoint)point
{
    CGFloat deltax = point.x - startingpoint.x;
    CGFloat deltay = point.y - startingpoint.y;
    
    [self verticalpanning:deltay];
}

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