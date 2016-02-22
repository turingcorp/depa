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
    return 70;
}

-(UIView*)overview
{
    vconfiglocation *over = [[vconfiglocation alloc] init];
    
    return over;
}

-(void)selected:(cconfig*)controller
{
    [[cmain singleton] pushViewController:[[cconfigloc alloc] init] animated:YES];
}

@end