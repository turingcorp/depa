#import "mplaymenu.h"

@implementation mplaymenu
{
    NSArray *array;
}

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