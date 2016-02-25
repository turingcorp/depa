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
    return 70;
}

-(UIView*)overview
{
    vconfiglike *over = [[vconfiglike alloc] init];
    
    return over;
}

-(void)selected:(cconfig*)controller
{
    [[cmain singleton] pushViewController:[[cconfigloc alloc] init] animated:YES];
}

@end