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
    return 100;
}

-(UIView*)overview
{
    vconfigmode *over = [[vconfigmode alloc] init];
    
    return over;
}

@end