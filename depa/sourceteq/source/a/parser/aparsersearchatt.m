#import "aparsersearchatt.h"

@implementation aparsersearchatt
{
    NSMutableArray *array;
}

-(instancetype)init:(NSArray*)json
{
    self = [super init];
    
    array = [NSMutableArray array];
    NSUInteger count = json.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        aparsersearchattitem *item;
        NSDictionary *rawitem = json[i];
        NSString *rawid = rawitem[@"id"];
        NSString *rawvalue = rawitem[@"value_name"];
        NSString *concreteid;
        NSArray *explodedid = [rawid componentsSeparatedByString:@"-"];
        NSUInteger found = explodedid.count;
        search_attr attr = search_attr_unknown;
        
        if(found == 1)
        {
            concreteid = explodedid[0];
        }
        else
        {
            concreteid = explodedid[1];
        }
        
        concreteid = concreteid.lowercaseString;
        
        if([concreteid isEqualToString:@"mtrs"])
        {
            attr = search_attr_mtrs;
        }
        else if([concreteid isEqualToString:@"ambqty"])
        {
            attr = search_attr_rooms;
        }
        else if([concreteid isEqualToString:@"bathqty"])
        {
            attr = search_attr_baths;
        }
        else if([concreteid isEqualToString:@"garage"])
        {
            attr = search_attr_garage;
        }
        
        item = [[aparsersearchattitem alloc] init:attr value:rawvalue];
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

-(aparsersearchattitem*)item:(NSUInteger)index
{
    aparsersearchattitem *item = array[index];
    
    return item;
}

-(aparsersearchattitem*)itemfor:(search_attr)attr
{
    aparsersearchattitem *item;
    NSUInteger count = [self count];
    
    for(NSUInteger i = 0; i < count; i++)
    {
        aparsersearchattitem *initem = [self item:i];
        
        if(initem.attr == attr)
        {
            item = initem;
            
            break;
        }
    }
    
    return item;
}

@end