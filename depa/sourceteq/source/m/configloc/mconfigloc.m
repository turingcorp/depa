#import "mconfigloc.h"

@implementation mconfigloc
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = @[
              [[mconfigloclist alloc] init],
              [[mconfiglocmap alloc] init]
              ];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mconfiglocprotocol>)item:(NSUInteger)index
{
    id<mconfiglocprotocol> item = array[index];
    
    return item;
}

@end