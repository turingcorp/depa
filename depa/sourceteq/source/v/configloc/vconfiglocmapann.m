#import "vconfiglocmapann.h"

@implementation vconfiglocmapann

-(instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vconfiglocmapannpoint *point = [[vconfiglocmapannpoint alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    self.point = point;
    
    [self addSubview:point];
    
    return self;
}

@end