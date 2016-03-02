#import "vconfigsort.h"

@implementation vconfigsort

-(instancetype)init
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

#pragma mark -
#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
}

@end