#import "mconfiglocation.h"

@implementation mconfiglocation

#pragma mark -
#pragma mark config protocol

-(BOOL)selectable
{
    return YES;
}

-(NSUInteger)cellheight
{
    return 60;
}

-(void)config:(vconfigcel*)cel
{
    
}

-(void)selected:(cconfig*)controller
{
    
}

@end