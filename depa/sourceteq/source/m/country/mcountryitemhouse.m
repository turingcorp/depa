#import "mcountryitemhouse.h"

@implementation mcountryitemhouse

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    NSString *rawbuy = dictionary[@"buy"];
    NSString *rawrent = dictionary[@"rent"];
    self.buy = [[mcountryitembuy alloc] init:rawbuy];
    self.rent = [[mcountryitemrent alloc] init:rawrent];
    
    return self;
}

#pragma mark public

-(NSString*)categoryformode:(search_mode)mode
{
    NSString *categoryid;
    
    switch(mode)
    {
        case search_mode_rent:
            
            categoryid = self.rent.categoryid;
            
            break;
            
        case search_mode_buy:
            
            categoryid = self.buy.categoryid;
            
            break;
    }
    
    return categoryid;
}

@end