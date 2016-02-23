#import "aparsersearch.h"

@implementation aparsersearch

-(instancetype)init:(NSDictionary*)json
{
    self = [super init:json];
    
    if(self.validjson)
    {
        self.array = [NSMutableArray array];
        NSDictionary *paging = self.validjson[@"paging"];
        NSArray *results = self.validjson[@"results"];
        NSUInteger count = results.count;
        
        for(NSUInteger i = 0; i < count; i++)
        {
            NSDictionary *itemresults =  results[i];
            msearchresult *item = [[msearchresult alloc] init:itemresults];
            
            [self.array addObject:item];
        }
        
        self.total = [paging[@"total"] unsignedIntegerValue];
        self.offset = [paging[@"offset"] unsignedIntegerValue];
        self.limit = [paging[@"limit"] unsignedIntegerValue];
    }
    
    return self;
}

@end