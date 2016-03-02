#import "mconfigsorrelevance.h"

@implementation mconfigsorrelevance

-(NSString*)description
{
    NSString *description = NSLocalizedString(@"config_order_relevance", nil);
    
    return description;
}

#pragma mark -
#pragma mark typ protocol

-(NSString*)sortparameter
{
    NSString *parameter = @"";
    
    return parameter;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_order_relevance", nil);
    
    return title;
}

-(NSString*)assetname
{
    NSString *assetname = @"relevance";
    
    return assetname;
}

-(search_order)type
{
    return search_order_relevance;
}

@end