#import "acalllocationstate.h"

@implementation acalllocationstate

-(instancetype)init:(mconfigloclistitem*)item
{
    NSString *categoryid = [item.country categoryforsettings];
    NSMutableString *vars = [NSMutableString string];
    [vars appendString:@"limit=0&offset=0&"];
    [vars appendFormat:@"category=%@", categoryid];
    
    self = [super init:item variables:vars];
    self.parser = [aparserlocationstate class];
    
    return self;
}

@end