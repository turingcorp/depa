#import "mconfigtype.h"

@implementation mconfigtype

#pragma mark -
#pragma mark config protocol

-(BOOL)selectable
{
    return NO;
}

-(NSUInteger)cellheight
{
    return 80;
}

-(void)config:(vconfigcel*)cel
{
    
}

-(void)selected:(cconfig*)controller
{
    
}

@end