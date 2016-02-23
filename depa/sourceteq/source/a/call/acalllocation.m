#import "acalllocation.h"

@implementation acalllocation

-(instancetype)init:(id)variables country:(mcountryitem*)country
{
    NSString *vars = [NSString stringWithFormat:@"%@&limit=0&offset=0", variables];
 
    self.country = country;
    self = [super init:vars];
    self.keyforendpoint = @"search";
    self.parser = [aparserlocation class];
    
    return self;
}

#pragma mark -
#pragma mark acall

-(void)buildendpoint:(NSDictionary*)params
{
    NSString *rawendpoint = params[@"search"];
    self.endpoint = [NSString stringWithFormat:rawendpoint, self.country.countryid];
}

@end