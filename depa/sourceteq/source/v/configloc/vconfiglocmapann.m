#import "vconfiglocmapann.h"

static const NSUInteger pointersize = 180;
static const NSUInteger minpointersize = 140;
static const NSUInteger pointmargin = 25;

@implementation vconfiglocmapann
{
    CGRect initialrect;
    CGFloat initialx;
    CGFloat initialy;
    CGFloat pointx;
    CGFloat pointy;
}

-(instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, pointersize, pointersize)];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vconfiglocmapannpoint *point = [[vconfiglocmapannpoint alloc] init];
    self.ispanning = NO;
    self.point = point;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
    [pan setDelegate:self];
    
    [self addSubview:point];
    [self addGestureRecognizer:pan];
    
    NSDictionary *views = @{@"point":point};
    NSDictionary *metrics = @{@"margin":@(pointmargin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[point]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[point]-(margin)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark gesture

-(BOOL)gestureRecognizer:(UIGestureRecognizer*)gesture shouldReceiveTouch:(UITouch*)touch
{
    CGPoint point = [touch locationInView:self.superview];
    initialx = point.x;
    initialy = point.y;
    
    return YES;
}

-(void)panning:(UIPanGestureRecognizer*)pan
{
    switch(pan.state)
    {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStatePossible:
        case UIGestureRecognizerStateChanged:
            
            if(self.ispanning)
            {
                CGPoint delta = [pan translationInView:self];
                CGFloat deltax = delta.x;
                CGFloat deltay = delta.y;
                CGFloat width;
                CGFloat height;
                
                if(initialx > pointx)
                {
                    width = initialrect.size.width + deltax;
                }
                else
                {
                    width = initialrect.size.width - deltax;
                }
                
                if(initialy > pointy)
                {
                    height = initialrect.size.height + deltay;
                }
                else
                {
                    height = initialrect.size.height - deltay;
                }
                
                if(width < minpointersize)
                {
                    width = minpointersize;
                }
                
                if(height < minpointersize)
                {
                    height = minpointersize;
                }
                
                CGFloat width_2 = width / 2.0;
                CGFloat height_2 = height / 2.0;
                CGFloat newx = pointx - width_2;
                CGFloat newy = pointy - height_2;
                [self setFrame:CGRectMake(newx, newy, width, height)];
            }
            else
            {
                self.ispanning = YES;
                initialrect = self.frame;
                pointx = self.center.x;
                pointy = self.center.y;
            }
            
            break;
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed:
            
            self.ispanning = NO;
            
            break;
    }
}

@end