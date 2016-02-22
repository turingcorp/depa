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
    [cel.overview removeFromSuperview];
    
    vconfiglocation *over = [[vconfiglocation alloc] init];
    [cel addSubview:over];
    cel.overview = over;
    
    
}

-(void)selected:(cconfig*)controller
{
    
}

@end