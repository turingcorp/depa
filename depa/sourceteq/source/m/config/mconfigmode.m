#import "mconfigmode.h"

@implementation mconfigmode

#pragma mark -
#pragma mark config protocol

-(BOOL)selectable
{
    return NO;
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

@end