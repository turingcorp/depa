#import "vitemcar.h"

static CGFloat const tresholdmin = 160.0;

typedef NS_ENUM(NSUInteger, pandirection)
{
    pandirection_right,
    pandirection_left
};

@implementation vitemcar
{
    pandirection direction;
    CGPoint startingpoint;
    CGFloat initialoffsety;
    CGFloat newoffsety;
    CGFloat deltax;
}

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    self.controller = controller;
    self.images = self.controller.item.images.items;
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
    
    if(self.nextimage)
    {
        BOOL changeimage = NO;
        
        if(deltax > tresholdmin && direction == pandirection_left)
        {
            changeimage = YES;
        }
        else if(deltax < -tresholdmin && direction == pandirection_right)
        {
            changeimage = YES;
        }
        
        if(changeimage)
        {
            [self.cellcurrent config:self.nextimage];
        }
        
        [self.cellnext setAlpha:0];
        self.nextimage = nil;
    }
}

-(void)panalpha
{
}

-(void)movepan:(CGPoint)point
{
    CGFloat deltay = point.y - startingpoint.y;
    deltax = point.x - startingpoint.x;
    
    [self verticalpanning:deltay];
    
    if(self.nextimage)
    {
        [self panalpha];
    }
    else
    {
        if(deltax > 0)
        {
            if(self.currentindex)
            {
                self.nextimage = self.images[self.currentindex - 1];
                direction = pandirection_left;
            }
        }
        else if(deltax < 0)
        {
            if(self.currentindex < self.images.count - 1)
            {
                self.nextimage = self.images[self.currentindex + 1];
                direction = pandirection_right;
            }
        }
        
        if(self.nextimage)
        {
            [self.cellnext config:self.nextimage];
            [self panalpha];
        }
    }
}

#pragma mark public

-(void)refresh
{
    if(self.controller.item.images.items.count)
    {
        self.currentindex = 0;
        self.nextimage = nil;
        
        [self.cellcurrent config:self.images[self.currentindex]];
    }
}

#pragma mark -

@end