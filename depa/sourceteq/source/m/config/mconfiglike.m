#import "mconfiglike.h"

@implementation mconfiglike

#pragma mark -
#pragma mark config protocol

-(BOOL)selectable
{
    return YES;
}

-(NSUInteger)cellheight
{
    return 80;
}

-(UIView*)overview
{
    vconfiglike *over = [[vconfiglike alloc] init];
    
    return over;
}

-(void)selected:(cconfig*)controller
{
    [[cmain singleton] pushViewController:[[cconfigitemlike alloc] init] animated:YES];
}

@end