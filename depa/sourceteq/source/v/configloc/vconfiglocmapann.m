#import "vconfiglocmapann.h"

static const NSUInteger annwidth = 500;
static const NSUInteger annheight = 500;
static const NSUInteger pointerwidth = 150;
static const NSUInteger pointerheight = 150;

@implementation vconfiglocmapann

-(instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, annwidth, annheight)];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vconfiglocmapannpoint *point = [[vconfiglocmapannpoint alloc] initWithFrame:[self rectforwidth:pointerwidth height:pointerheight]];
    self.point = point;
    
    [self addSubview:point];
    
    return self;
}

#pragma mark functionality

-(CGRect)rectforwidth:(CGFloat)width height:(CGFloat)height
{
    CGRect rect = CGRectMake((annwidth - width) / 2.0, (annheight - height) / 2.0, width, height);
    
    return rect;
}

@end