#import "mconfiglocmap.h"

@implementation mconfiglocmap

#pragma mark -
#pragma mark config loc protocol

-(NSString*)assetname
{
    NSString *asset = @"map";
    
    return asset;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_menu_map", nil);
    
    return title;
}

-(Class)overview
{
    Class class = [vconfiglocmap class];
    
    return class;
}

@end