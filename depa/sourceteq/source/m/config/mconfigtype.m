#import "mconfigtype.h"

@implementation mconfigtype

#pragma mark -
#pragma mark config protocol

-(BOOL)selectable
{
    return NO;
}

-(NSUInteger)cellheight
{
    return 120;
}

-(UIView*)overview
{
    vconfigtype *over = [[vconfigtype alloc] init];
    
    return over;
}

@end