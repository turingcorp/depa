#import "aparserlocation.h"

@implementation aparserlocation

-(instancetype)init:(NSDictionary*)json
{
    self = [super init:json];
    
    if(self.validjson)
    {
        NSLog(@"%@", self.validjson);
    }
    
    return self;
}

@end