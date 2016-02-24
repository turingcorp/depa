#import "acalllocation.h"
#import "mcountryitem.h"

@implementation acalllocation

-(instancetype)init:(mconfigloclistitem*)item
{
    self = [self init:item variables:nil];
    
    return self;
}

-(instancetype)init:(mconfigloclistitem*)item variables:(NSString*)variables
{
    self = [super init:variables];
    self.item = item;
    self.keyforendpoint = @"search";
    
    return self;
}

#pragma mark -
#pragma mark acall

-(void)buildendpoint:(NSDictionary*)params
{
    NSString *rawendpoint = params[self.keyforendpoint];
    self.endpoint = [NSString stringWithFormat:rawendpoint, self.item.country.countryid];
}

@end