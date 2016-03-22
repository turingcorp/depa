#import "mliked.h"

@implementation mliked
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    self.fonttitle = [UIFont fontWithName:fontname size:14];
    self.fontprice = [UIFont fontWithName:fontname size:12];
    
    return self;
}

#pragma mark public

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
                           mlikeditem *item = [[mlikeditem alloc] init:self];
                           [item title:rawitem.title currency:rawitem.currency price:rawitem.price];
                           item.itemid = rawitem.itemid;
                           item.thumbnail = rawitem.thumbnail;
                           item.type = rawitem.type;
                           item.mode = rawitem.mode;
                           item.contactphone = rawitem.phone;
                           
                           [array addObject:item];
                       }
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notlikedloaded object:nil];
                   });
}

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