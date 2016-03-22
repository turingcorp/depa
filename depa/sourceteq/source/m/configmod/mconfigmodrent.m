#import "mconfigmodrent.h"

static NSUInteger const cpricemax = 25000;
static NSUInteger const cpricemaxmin = 3100;
static NSUInteger const cpricemin = 3000;
static NSUInteger const cpriceminmax = 20000;

@implementation mconfigmodrent

-(NSString*)description
{
    NSString *description = NSLocalizedString(@"search_mode_rent", nil);
    
    return description;
}

#pragma mark -
#pragma mark config mode protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_mode_rent", nil);
    
    return title;
}

-(search_mode)type
{
    return search_mode_rent;
}

-(NSUInteger)pricemax
{
    return cpricemax;
}

-(NSUInteger)pricemaxmin
{
    return cpricemaxmin;
}

-(NSUInteger)pricemin
{
    return cpricemin;
}

-(NSUInteger)priceminmax
{
    return cpriceminmax;
}

@end