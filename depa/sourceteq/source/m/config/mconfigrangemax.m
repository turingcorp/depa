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
    vconfigrangemax *over = [[vconfigrangemax alloc] init];
    
    return over;
}

@end