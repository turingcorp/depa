#import "vconfigtypecel.h"

@implementation vconfigtypecel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    
    
    return self;
}

#pragma mark public

-(void)config:(id<mconfigtypprotocol>)model
{
    
}

@end