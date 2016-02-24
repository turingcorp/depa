#import "aparserlocationcity.h"

@implementation aparserlocationcity

-(instancetype)init:(NSDictionary*)json
{
    self.filterid = @"city";
    self = [super init:json];
    
    return self;
}

@end