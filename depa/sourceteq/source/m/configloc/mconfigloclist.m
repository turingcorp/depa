#import "mconfigloclist.h"

@implementation mconfigloclist

#pragma mark -
#pragma mark config loc protocol

-(NSString*)assetname
{
    NSString *asset = @"list";
    
    return asset;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_menu_list", nil);
    
    return title;
}

-(Class)overview
{
    Class class = [vconfigloclist class];
    
    return class;
}

@end