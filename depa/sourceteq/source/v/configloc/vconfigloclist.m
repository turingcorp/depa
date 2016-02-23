#import "vconfigloclist.h"

@implementation vconfigloclist

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blueColor]];
    
    return self;
}

@end