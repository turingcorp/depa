#import "mconfigmode.h"

@implementation mconfigmode

#pragma mark -
#pragma mark config protocol

-(BOOL)selectable
{
    return YES;
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