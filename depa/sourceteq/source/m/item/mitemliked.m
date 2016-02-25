#import "mitemliked.h"

@implementation mitemliked
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    return self;
}

#pragma mark functionality

-(void)load
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       
                       
                   });
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mitemitem*)item:(NSUInteger)index
{
    mitemitem *item = array[index];
    
    return item;
}

@end