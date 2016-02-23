#import "acalllocationstate.h"

@implementation acalllocationstate

-(instancetype)init:(mcountryitem*)country
{
    NSString *categoryid = [country categoryforsettings];
    NSMutableString *vars = [NSMutableString string];
    [vars appendString:@"limit=0&offset=0&"];
    [vars appendFormat:@"category=%@", categoryid];
    
    self = [super init:country variables:vars];
    
    return self;
}

@end