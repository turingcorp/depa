#import "mconfigrangemin.h"

@implementation mconfigrangemin

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
    vconfigrangemin *over = [[vconfigrangemin alloc] init];
    
    return over;
}

@end