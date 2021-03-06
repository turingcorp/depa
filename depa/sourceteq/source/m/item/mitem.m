#import "mitem.h"

@implementation mitem
{
    NSMutableDictionary *dictionary;
}

+(instancetype)singleton
{
    static mitem *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

#pragma mark public

-(void)load:(NSString*)countryid
{
    __weak typeof(self) weakself = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       weakself.countryid = countryid;
                       [weakself insideload];
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notitemsloaded object:nil];
                   });
}

-(void)insideload
{
    dictionary = [NSMutableDictionary dictionary];
    NSString *query = [NSString stringWithFormat:
                       @"SELECT id, itemid, status "
                       "FROM item "
                       "WHERE countryid=\"%@\" "
                       "ORDER BY id ASC;",
                       self.countryid];
    NSArray *rawarray = [db rows:query];
    NSUInteger count = rawarray.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawitem = rawarray[i];
        NSString *rawitemid = rawitem[@"itemid"];
        NSUInteger rawid = [rawitem[@"id"] unsignedIntegerValue];
        item_status rawstatus = (item_status)[rawitem[@"status"] unsignedIntegerValue];
        mitemitem *item = [[mitemitem alloc] init:rawid itemid:rawitemid status:rawstatus];
        
        [self add:item];
    }
}

-(void)add:(mitemitem*)item
{
    dictionary[item.itemid] = item;
}

-(mitemitem*)item:(NSString*)itemid
{
    mitemitem *item = dictionary[itemid];
    
    return item;
}

@end