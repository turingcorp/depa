#import "aparserlocation.h"

@implementation aparserlocation

-(instancetype)init:(NSDictionary*)json
{
    self = [super init:json];
    
    if(self.validjson)
    {
        self.array = [NSMutableArray array];
        
        NSLog(@"%@", self.validjson);
    }
    
    return self;
}

@end