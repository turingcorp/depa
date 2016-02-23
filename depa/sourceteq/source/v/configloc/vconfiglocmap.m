#import "vconfiglocmap.h"

@implementation vconfiglocmap

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor greenColor]];
    
    return self;
}

@end