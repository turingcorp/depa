#import "aparserlocation.h"
#import "mconfigloclistitem.h"

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
            NSString *rawfilterid = filtersitem[@"id"];
            
            if([rawfilterid isEqualToString:self.filterid])
            {
                [self fillarray:filtersitem];
                
                break;
            }
        }
    }
    
    return self;
}

#pragma mark functionality

-(void)fillarray:(NSDictionary*)filter
{
    NSArray *values = filter[@"values"];
    NSUInteger count = values.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawvalue = values[i];
        NSString *rawid = rawvalue[@"id"];
        NSString *rawname = rawvalue[@"name"];
        
        mconfigloclistitem *item = [[mconfigloclistitem alloc] init];
        item.itemid = rawid;
        item.title = rawname;
        
        [self.array addObject:item];
    }
}

@end