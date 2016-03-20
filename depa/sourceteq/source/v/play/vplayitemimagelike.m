#import "vplayitemimagelike.h"

static NSUInteger const starsize = 24;
static NSUInteger const maxticks = 60;
static NSInteger const increase = 2;

@implementation vplayitemimagelike
{
    CGFloat starmaxy;
    CGFloat starmaxx;
    NSUInteger ticks;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    self.stars = [NSMutableArray array];
    
    starmaxx = frame.size.width - starsize;
    starmaxy = frame.size.height + starsize;
    ticks = 0;
    
    [self addstar];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
    return self;
}

-(void)dealloc
{
    [self.timer invalidate];
}

#pragma mark functionality

-(void)tick:(NSTimer*)timer
{
    ticks++;
    
    [self movestars];
    [self addstar];
    
    if(ticks > maxticks)
    {
        [timer invalidate];
    }
}

-(void)movestars
{
    for(vplayitemimagelikestar *star in self.stars)
    {
        CGPoint point = star.center;
        point.y -= increase;
        point.x += star.deltax * increase;
        
        [star setCenter:point];
    }
}

-(void)addstar
{
    CGFloat alpha = (arc4random_uniform(8) / 10.0) + 0.1;
    NSUInteger currentx = arc4random_uniform(starmaxx);
    NSUInteger currenty = starmaxy;
    NSInteger deltax = arc4random_uniform(3) - 1;
    
    vplayitemimagelikestar *star = [[vplayitemimagelikestar alloc] initWithFrame:CGRectMake(currentx, currenty, starsize, starsize)];
    [star setAlpha:alpha];
    star.deltax = deltax;
    [self addSubview:star];
    [self.stars addObject:star];
}

@end