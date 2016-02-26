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
                       NSArray *rawarray = [mdb allitemsfor:item_status_like];
                       NSUInteger count = rawarray.count;
                       
                       for(NSUInteger i = 0; i < count; i++)
                       {
                           mdbitem *rawitem = rawarray[i];
                           mlikeditem *item = [[mlikeditem alloc] init];
                           item.title = rawitem.title;
                           item.currencyid = rawitem.currency;
                           item.price = rawitem.price;
                           
                           [array addObject:item];
                       }
                       
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