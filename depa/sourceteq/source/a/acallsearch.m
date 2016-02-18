#import "acallsearch.h"

@implementation acallsearch

-(instancetype)init:(id)variables
{
    self = [super init:variables];
    
    self.keyforendpoint = @"search";
    
    return self;
}

#pragma mark -
#pragma mark acall

-(void)buildendpoint:(NSDictionary*)params
{
    NSString *countryid = @"MLM";
    NSString *rawendpoint = params[@"search"];
    self.endpoint = [NSString stringWithFormat:rawendpoint, countryid];
}

//https://api.mercadolibre.com/sites/MLM/search?has_pictures=yes&limit=1&offset=0&category=1479

@end