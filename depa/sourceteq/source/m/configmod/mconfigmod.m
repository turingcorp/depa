#import "mconfigmod.h"

@implementation mconfigmod
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = @[
              [[mconfigmodrent alloc] init],
              [[mconfigmodbuy alloc] init]
              ];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mconfigmodprotocol>)item:(NSUInteger)index;
{
    id<mconfigmodprotocol> item = array[index];
    
    return item;
}

-(id<mconfigmodprotocol>)modewithtype:(search_mode)type
{
    id<mconfigmodprotocol> item;
    
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