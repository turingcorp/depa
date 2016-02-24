#import "acallsearch.h"

@implementation acallsearch

-(instancetype)init:(id)variables
{
    self = [super init:variables];
    
    self.keyforendpoint = @"search";
    self.parser = [[aparsersearch alloc] init];
    
    return self;
}

#pragma mark -
#pragma mark acall

-(void)buildendpoint:(NSDictionary*)params
{
    NSString *rawendpoint = params[self.keyforendpoint];
    self.endpoint = [NSString stringWithFormat:rawendpoint, [msettings singleton].country.countryid];
}

@end