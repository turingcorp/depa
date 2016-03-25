#import "mconfigmodbuy.h"

static NSUInteger const cpricemax = 7000000;
static NSUInteger const cpricemaxmin = 710000;
static NSUInteger const cpricemin = 700000;
static NSUInteger const cpriceminmax = 6500000;

@implementation mconfigmodbuy

-(NSString*)description
{
    NSString *description = NSLocalizedString(@"search_mode_buy", nil);
    
    return description;
}

#pragma mark -
#pragma mark config mode protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_mode_buy", nil);
    
    return title;
}

-(search_mode)type
{
    return search_mode_buy;
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