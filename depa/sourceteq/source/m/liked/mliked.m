#import "mliked.h"

@implementation mliked
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    [self load];
    
    return self;
}

#pragma mark functionality

-(void)load
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       array = [NSMutableArray array];
                       NSString *query = [NSString stringWithFormat:
                                          @"SELECT "];
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notlikedloaded object:nil];
                   });
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mlikeditem*)item:(NSUInteger)index
{
    mlikeditem *item = array[index];
    
    return item;
}

@end