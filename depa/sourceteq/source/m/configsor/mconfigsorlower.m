#import "mconfigsorlower.h"

@implementation mconfigsorlower

-(NSString*)description
{
    NSString *description = NSLocalizedString(@"config_order_lower", nil);
    
    return description;
}

#pragma mark -
#pragma mark typ protocol

-(NSString*)sortparameter
{
    NSString *parameter = @"&sort=price_asc";
    
    return parameter;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_order_lower", nil);
    
    return title;
}

-(NSString*)assetname
{
    NSString *assetname = @"priceasc";
    
    return assetname;
}

-(search_order)type
{
    return search_order_lower;
}

@end