#import "acalllocation.h"
#import "mcountryitem.h"

@implementation acalllocation

-(instancetype)init:(mconfigloclistitem*)item
{
    NSMutableString *vars = [NSMutableString string];
    [vars appendString:@"limit=0&offset=0&"];
    [vars appendFormat:@"category=%@&", [item.country categoryforsettings]];
    [vars appendString:[item path]];
    
    self = [super init:vars];
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