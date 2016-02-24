#import "mconfigtyphouse.h"

@implementation mconfigtyphouse

-(NSString*)description
{
    NSString *description = NSLocalizedString(@"", nil);
    
    return description;
}

#pragma mark -
#pragma mark typ protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_type_house", nil);
    
    return title;
}

-(NSString*)assetname
{
    NSString *assetname = @"house";
    
    return assetname;
}

-(search_type)type
{
    return search_type_house;
}

@end