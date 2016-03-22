#import "mconfigno.h"

@implementation mconfigno

#pragma mark -
#pragma mark config protocol

-(BOOL)selectable
{
    return YES;
}

-(NSUInteger)cellheight
{
    return 130;
}

-(UIView*)overview
{
    vconfigno *over = [[vconfigno alloc] init];
    
    return over;
}

-(void)selected:(cconfig*)controller
{
    [[cmain singleton] pushViewController:[[cconfigitemno alloc] init] animated:YES];
}

@end