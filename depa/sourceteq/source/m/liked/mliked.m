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
                           mlikeditem *item = [[mlikeditem alloc] init:self];
                           NSString *displaytitle;
                           
                           switch(rawitem.mode)
                           {
                                case search_mode_rent:
                                   
                                   displaytitle = NSLocalizedString(@"search_mode_rent", nil);
                                   
                                   break;
                                   
                                case search_mode_buy:
                                   
                                   displaytitle = NSLocalizedString(@"search_mode_buy", nil);
                                   
                                   break;
                           }
                           
                           [item title:rawitem.title currency:rawitem.currency price:rawitem.price];
                           item.itemid = rawitem.itemid;
                           item.thumbnail = rawitem.thumbnail;
                           item.displaytitle = displaytitle;
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