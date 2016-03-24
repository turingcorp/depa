#import "vitemcar.h"

static CGFloat const threshold = 80.0;

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
        
        if(direction == pandirection_left)
        {
            CGFloat minthreshold = threshold / 2.0;
            
            if(deltax > minthreshold)
            {
                self.currentindex--;
                changeimage = YES;
            }
        }
        else if(direction == pandirection_right)
        {
            CGFloat minthreshold = threshold / -2.0;
            
            if(deltax < minthreshold)
            {
                self.currentindex++;
                changeimage = YES;
            }
        }
        
        if(changeimage)
        {
            __weak typeof(self.cellnext) auxcell = self.cellcurrent;
            self.cellcurrent = self.cellnext;
            self.cellnext = auxcell;
        }
        
        self.nextimage = nil;
        
        [UIView animateWithDuration:0.4 animations:
         ^
         {
             [self.cellcurrent setAlpha:1];
             [self.cellnext setAlpha:0];
         }];
    }
    
    [self bouncepaging];
}

-(void)panalpha
{
    CGFloat alphacurrent;
    CGFloat alphanext;
    
    if(direction == pandirection_left)
    {
        alphacurrent = (threshold - deltax) / threshold;
        alphanext = deltax / threshold;
    }
    else
    {
        alphacurrent = (threshold - (-deltax)) / threshold;
        alphanext = -deltax / threshold;
    }
    
    if(alphacurrent < 0)
    {
        alphacurrent = 0;
    }
    else if(alphacurrent > 1)
    {
        alphacurrent = 1;
    }
    
    if(alphanext < 0)
    {
        alphanext = 0;
    }
    else if(alphanext > 1)
    {
        alphanext = 1;
    }
    
    [self.cellnext setAlpha:alphanext];
    [self.cellcurrent setAlpha:alphacurrent];
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

-(void)bouncepaging
{
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:self.currentindex inSection:0];
    [self.paging.collection selectItemAtIndexPath:indexpath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
}

#pragma mark public

-(void)refresh
{
    if(self.controller.item.images.items.count)
    {
        self.currentindex = 0;
        self.nextimage = nil;
        
        [self.cellcurrent config:self.images[self.currentindex]];
        [self bouncepaging];
    }
}

-(void)loadpaging:(vitemcarpaging*)paging
{
    self.paging = paging;
    [self bouncepaging];
}

@end