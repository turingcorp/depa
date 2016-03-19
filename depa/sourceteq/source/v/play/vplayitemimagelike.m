#import "vplayitemimagelike.h"

static NSUInteger const starsize = 20;

@implementation vplayitemimagelike
{
    CGFloat starmaxy;
    CGFloat starmaxx;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    self.stars = [NSMutableArray array];
    
    starmaxx = frame.size.width - starsize;
    starmaxy = frame.size.height + starsize;
    
    [self addstar];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
    return self;
}

-(void)dealloc
{
    [self.timer invalidate];
}

#pragma mark functionality

-(void)tick:(NSTimer*)timer
{
    [self movestars];
    [self addstar];
}

-(void)movestars
{
    for(vplayitemimagelikestar *star in self.stars)
    {
        CGPoint point = star.center;
        point.y--;
        point.x += star.deltax;
        
        [star setCenter:point];
    }
}

-(void)addstar
{
    CGFloat alpha = (arc4random_uniform(8) / 10.0) + 0.2;
    NSUInteger currentx = arc4random_uniform(starmaxx);
    NSUInteger currenty = arc4random_uniform(starmaxy);
    NSUInteger deltax = arc4random_uniform(3) - 1;
    
    vplayitemimagelikestar *star = [[vplayitemimagelikestar alloc] initWithFrame:CGRectMake(currentx, currenty, starsize, starsize)];
    [star setAlpha:alpha];
    star.deltax = deltax;
    [self addSubview:star];
    [self.stars addObject:star];
}

@end