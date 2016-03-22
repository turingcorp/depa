#import "mconfigsort.h"

@implementation mconfigsort

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
    vconfigsort *over = [[vconfigsort alloc] init];
    
    return over;
}

@end