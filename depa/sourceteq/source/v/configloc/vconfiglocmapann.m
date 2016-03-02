#import "vconfiglocmapann.h"

static const NSUInteger annwidth = 500;
static const NSUInteger annheight = 500;
static const NSUInteger pointerwidth = 150;
static const NSUInteger pointerheight = 150;

@implementation vconfiglocmapann
{
    CGRect initialrect;
}

-(instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, annwidth, annheight)];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vconfiglocmapannpoint *point = [[vconfiglocmapannpoint alloc] initWithFrame:[self rectforwidth:pointerwidth height:pointerheight]];
    self.ispanning = NO;
    self.point = point;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
    
    [self addSubview:point];
    [self addGestureRecognizer:pan];
    
    return self;
}

#pragma mark functionality

-(CGRect)rectforwidth:(CGFloat)width height:(CGFloat)height
{
    CGRect rect = CGRectMake((annwidth - width) / 2.0, (annheight - height) / 2.0, width, height);
    
    return rect;
}

#pragma mark gesture

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
                CGFloat width = initialrect.size.width + delta.x;
                CGFloat height = initialrect.size.height + delta.y;
                
                if(width > height)
                {
                    height = width;
                }
                else
                {
                    width = height;
                }
                
                [self.point setFrame:[self rectforwidth:width height:height]];
            }
            else
            {
                self.ispanning = YES;
                initialrect = self.point.frame;
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