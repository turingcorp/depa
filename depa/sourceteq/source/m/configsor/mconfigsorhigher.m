#import "mconfigsorhigher.h"

@implementation mconfigsorhigher

-(NSString*)description
{
    NSString *description = NSLocalizedString(@"config_order_higher", nil);
    
    return description;
}

#pragma mark -
#pragma mark typ protocol

-(NSString*)sortparameter
{
    NSString *parameter = @"&sort=price_desc";
    
    return parameter;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_order_higher", nil);
    
    return title;
}

-(NSString*)assetname
{
    NSString *assetname = @"sorthigher";
    
    return assetname;
}

-(search_order)type
{
    return search_order_higher;
}

@end