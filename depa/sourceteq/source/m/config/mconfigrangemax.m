#import "mconfigrangemax.h"

@implementation mconfigrangemax

#pragma mark -
#pragma mark config protocol

-(BOOL)selectable
{
    return NO;
}

-(NSUInteger)cellheight
{
    return 195;
}

-(UIView*)overview
{
    vconfigrangemax *over = [[vconfigrangemax alloc] init];
    
    return over;
}

@end