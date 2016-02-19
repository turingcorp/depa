#import "mplaymenu.h"

@implementation mplaymenu
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = @[
              [[mplaymenuno alloc] init],
              [[mplaymenulike alloc] init]
              ];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mplaymenuprotocol>)item:(NSUInteger)index
{
    id<mplaymenuprotocol> item = array[index];
    
    return item;
}

@end