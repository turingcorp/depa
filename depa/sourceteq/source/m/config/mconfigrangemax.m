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
    return 140;
}

-(UIView*)overview
{
    vconfiglike *over = [[vconfiglike alloc] init];
    
    return over;
}

@end