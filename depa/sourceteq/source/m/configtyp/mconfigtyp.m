#import "mconfigtyp.h"

@implementation mconfigtyp
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = @[
              [[mconfigtypapartment alloc] init],
              [[mconfigtyphouse alloc] init]
              ];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mconfigtypprotocol>)item:(NSUInteger)index
{
    id<mconfigtypprotocol> item = array[index];
    
    return item;
}

-(id<mconfigtypprotocol>)itemwithtype:(search_type)type
{
    id<mconfigtypprotocol> item;
    
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