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
    return 90;
}

-(UIView*)overview
{
    vconfiglocation *over = [[vconfiglocation alloc] init];
    
    return over;
}

-(void)selected:(cconfig*)controller
{
    
}

@end