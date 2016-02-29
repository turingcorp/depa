#import "acalldesc.h"

@implementation acalldesc

-(instancetype)init:(id)variables
{
    self = [super init:variables];
    
    self.keyforendpoint = @"desc";
    self.parser = [[aparserdesc alloc] init];
    
    return self;
}

#pragma mark -
#pragma mark acall

-(void)buildendpoint:(NSDictionary*)params
{
    NSString *rawendpoint = params[self.keyforendpoint];
    self.endpoint = [NSString stringWithFormat:rawendpoint, self.variables];
    self.variables = @"";
}

@end