#import "acalllocation.h"
#import "mcountryitem.h"

@implementation acalllocation

-(instancetype)init:(mcountryitem*)country
{
    self = [self init:country variables:nil];
    
    return self;
}

-(instancetype)init:(mcountryitem*)country variables:(NSString*)variables
{
    self = [super init:variables];
    self.country = country;
    self.keyforendpoint = @"search";
    self.parser = [aparserlocationstate class];
    
    return self;
}

#pragma mark -
#pragma mark acall

-(void)buildendpoint:(NSDictionary*)params
{
    NSString *rawendpoint = params[self.keyforendpoint];
    self.endpoint = [NSString stringWithFormat:rawendpoint, self.country.countryid];
}

@end