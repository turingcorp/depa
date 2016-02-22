#import "mconfiglocmap.h"

@implementation mconfiglocmap

#pragma mark -
#pragma mark config loc protocol

-(NSString*)assetname
{
    NSString *asset = @"";
    
    return asset;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_menu_map", nil);
    
    return title;
}

-(UIView*)overview
{
    vconfiglocmap *map = [[vconfiglocmap alloc] init];
    
    return nil;
}

@end