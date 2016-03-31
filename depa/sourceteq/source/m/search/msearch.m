#import "msearch.h"

static NSUInteger const itemslimit = 10;

@implementation msearch
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    self.current = 0;
    self.offset = 0;
    array = [NSMutableArray array];
    
    NSMutableString *string = [NSMutableString string];
    [string appendString:[[msettings singleton].searchtype description]];
    [string appendFormat:@" %@ ", [[msettings singleton].searchmode description]];
    self.displayname = string;
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(msearchresult*)item:(NSUInteger)index
{
    msearchresult *item = array[index];
    
    return item;
}

-(void)remove:(NSUInteger)index
{
    [array removeObjectAtIndex:index];
}

-(NSString*)variables
{
    NSUInteger offset = self.offset;
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"category=%@", [[msettings singleton].country categoryforsettings]];
    [string appendString:[[msettings singleton].searchorder sortparameter]];
    [string appendString:@"&has_pictures=yes"];
    [string appendFormat:@"&limit=%@", @(itemslimit)];
    [string appendFormat:@"&offset=%@", @(offset)];
    [string appendFormat:@"&price=%@&", [[msettings singleton] pricerange]];
    [string appendString:[msettings singleton].location];
    
    return string;
}

-(void)stats:(aparsersearch*)searchresults
{
    self.total = searchresults.total;
    self.offset = searchresults.offset + itemslimit;
}

-(void)join:(aparsersearch*)searchresults
{
    [array addObjectsFromArray:searchresults.array];
}

-(msearchresult*)next
{
    msearchresult *item;
    
    if([self count])
    {
        self.current++;
        item = [self item:0];
        item.search = self;
        [self remove:0];
    }
    
    return item;
}

@end