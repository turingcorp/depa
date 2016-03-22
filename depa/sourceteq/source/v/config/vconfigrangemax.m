#import "vconfigrangemax.h"

@implementation vconfigrangemax

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
}

@end