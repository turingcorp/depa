#import "mconfigsor.h"

@implementation mconfigsor
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = @[
              [[mconfigsorlower alloc] init],
              [[mconfigsorhigher alloc] init],
              [[mconfigsorrelevance alloc] init]
              ];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mconfigsorprotocol>)item:(NSUInteger)index
{
    id<mconfigsorprotocol> item = array[index];
    
    return item;
}

-(id<mconfigsorprotocol>)itemwithtype:(search_order)type
{
    id<mconfigsorprotocol> item;
    
    NSUInteger count = array.count;
    for(NSUInteger i = 0; i < count; i++)
    {
        item = array[i];
        
        if([item type] == type)
        {
            break;
        }
    }
    
    return item;
}

@end