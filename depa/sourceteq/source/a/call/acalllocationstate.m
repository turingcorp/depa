#import "acalllocationstate.h"

@implementation acalllocationstate

-(instancetype)init:(mcountryitem*)country
{
    NSString *categoryid = [country categoryforsettings];
    NSMutableString *vars = [NSMutableString string];
    [vars appendString:@"limit=0&offset=0&"];
    [vars appendFormat:@"category=%@", categoryid];
    
    self = [super init:vars];
    self.country = country;
    self.keyforendpoint = @"search";
    self.parser = [aparserlocationstate class];
    
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