#import "aparserlocation.h"

@implementation aparserlocation

-(instancetype)init:(NSDictionary*)json
{
    self = [super init:json];
    
    if(self.validjson)
    {
        self.array = [NSMutableArray array];
        NSArray *filters = self.validjson[@"available_filters"];
        NSUInteger count = filters.count;
        
        for(NSUInteger i = 0; i < count; i++)
        {
            NSDictionary *filtersitem = filters[i];
            
            if
        }
    }
    
    return self;
}

@end