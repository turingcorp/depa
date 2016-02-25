#import "mitem.h"

@implementation mitem
{
    NSMutableArray *array;
}

-(instancetype)init:(NSString*)countryid
{
    self = [super init];
    
    array = [NSMutableArray array];
    NSString *query = [NSString stringWithFormat:
                       @"SELECT id, itemid, status FROM item "
                       "WHERE countryid=\"%@\" "
                       "ORDER BY id ASC",
                       countryid];
    NSArray *rawarray = [db rows:query];
    NSUInteger count = rawarray.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawitem = rawarray[i];
        NSString *rawid = rawitem[@"id"];
        NSString *rawitemid = rawitem[@"itemid"];
        item_status rawstatus = (item_status)[rawitem[@"status"] unsignedIntegerValue];
        mitemitem *item = [[mitemitem alloc] init:rawid itemid:rawitemid status:rawstatus];
        
        [array addObject:item];
    }
    
    return self;
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