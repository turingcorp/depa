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

@end