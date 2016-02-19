#import "mplaymenulike.h"

@implementation mplaymenulike

#pragma mark -
#pragma mark play protocol

-(NSString*)assetname
{
    NSString *name = @"like";
    
    return name;
}

-(UIColor*)tintcolor
{
    UIColor *color = [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1];
    
    return color;
}

@end