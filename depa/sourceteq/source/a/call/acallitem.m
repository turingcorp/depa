#import "acallitem.h"

@implementation acallitem

-(instancetype)init:(id)variables
{
    self = [super init:variables];
    
    self.keyforendpoint = @"item";
    self.parser = [[aparseritem alloc] init];
    
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