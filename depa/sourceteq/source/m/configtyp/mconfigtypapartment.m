#import "mconfigtypapartment.h"

@implementation mconfigtypapartment

-(NSString*)description
{
    NSString *description = NSLocalizedString(@"search_type_flat", nil);
    
    return description;
}

#pragma mark -
#pragma mark typ protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_type_apartment", nil);
    
    return title;
}

-(NSString*)assetname
{
    NSString *assetname = @"apt";
    
    return assetname;
}

-(search_type)type
{
    return search_type_apartment;
}

@end