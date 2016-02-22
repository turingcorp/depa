#import "mconfigloclist.h"

@implementation mconfigloclist

#pragma mark -
#pragma mark config loc protocol

-(NSString*)assetname
{
    NSString *asset = @"";
    
    return asset;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_menu_list", nil);
    
    return title;
}

-(UIView*)overview
{
    vconfigloclist *list = [[vconfigloclist alloc] init];
    
    return nil;
}

@end