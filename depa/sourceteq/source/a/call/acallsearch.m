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

@end