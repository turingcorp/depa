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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       self.countryid = countryid;
                       [self insideload];
                       
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

-(mitemitem*)newitem:(NSString*)itemid thumbnail:(NSString*)thumbnail
{
    mitemitem *item;
    item_status status = item_status_none;
    NSUInteger now = [NSDate date].timeIntervalSince1970;
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO item "
                       "(created, countryid, itemid, status, thumbnail) "
                       "VALUES(%@, \"%@\", \"%@\", %@, \"%@\");",
                       @(now), self.countryid, itemid, @(status), thumbnail];
    NSUInteger dbid = [db query_identity:query];
    item = [[mitemitem alloc] init:dbid itemid:itemid status:status];
    
    [self add:item];
    
    return item;
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