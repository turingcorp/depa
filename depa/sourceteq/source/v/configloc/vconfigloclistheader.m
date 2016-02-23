#import "vconfigloclistheader.h"

@implementation vconfigloclistheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(void)config:(mconfigloclistitem*)model
{
    
}

@end