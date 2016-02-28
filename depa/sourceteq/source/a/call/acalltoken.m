#import "acalltoken.h"

@implementation acalltoken

-(instancetype)init:(id)variables
{
    self = [super init:variables];
    
    self.post = YES;
    self.keyforendpoint = @"token";
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