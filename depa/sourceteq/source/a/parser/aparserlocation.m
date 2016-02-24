#import "aparserlocation.h"
#import "mconfigloclistitem.h"

@implementation aparserlocation

-(instancetype)init:(mconfigloclistitem*)item
{
    self = [super init];
    
    self.item = item;
    
    return self;
}

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        self.array = [NSMutableArray array];
        NSArray *filters = self.validjson[@"available_filters"];
        NSString *filterid = [self.item.strategyinstance filterid];
        NSUInteger count = filters.count;
        BOOL found = NO;
        
        for(NSUInteger i = 0; i < count; i++)
        {
            NSDictionary *filtersitem = filters[i];
            NSString *rawfilterid = filtersitem[@"id"];
            
            if([rawfilterid isEqualToString:filterid])
            {
                [self fillarray:filtersitem];
                found = YES;
                
                break;
            }
        }
        
        if(!found)
        {
            if([self.item.strategyinstance respondsToSelector:@selector(nofilters:parser:)])
            {
                [self.item.strategyinstance nofilters:json parser:self];
            }
        }
    }
}

#pragma mark functionality

-(void)fillarray:(NSDictionary*)filter
{
    mcountryitem *country = self.item.country;
    NSArray *values = filter[@"values"];
    NSUInteger count = values.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawvalue = values[i];
        NSString *rawid = rawvalue[@"id"];
        NSString *rawname = rawvalue[@"name"];
        
        mconfigloclistitem *item = [[mconfigloclistitem alloc] init:country];
        item.parent = self.item;
        item.strategy = self.strategy;
        item.itemid = rawid;
        item.title = rawname;
        
        [self.array addObject:item];
    }
}

@end