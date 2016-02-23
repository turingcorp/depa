#import "aparserlocationstate.h"

@implementation aparserlocationstate

-(instancetype)init:(NSDictionary*)json
{
    self.filterid = @"state";
    self = [super init:json];
    
    return self;
}

@end