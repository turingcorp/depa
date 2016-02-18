#import "aparsersearch.h"

@implementation aparsersearch

-(instancetype)init:(NSDictionary*)json
{
    self = [super init:json];
    
    if(self.validjson)
    {
        self.array = [NSMutableArray array];
        NSArray *results = json[@"results"];
        NSUInteger count = results.count;
        
        for(NSUInteger i = 0; i < count; i++)
        {
            NSDictionary *itemresults =  results[i];
            
        }
    }
    
    return self;
}

@end