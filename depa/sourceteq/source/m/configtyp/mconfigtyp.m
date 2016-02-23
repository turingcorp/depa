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

@end