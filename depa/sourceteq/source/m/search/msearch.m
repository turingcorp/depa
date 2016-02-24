#import "msearch.h"

static const NSUInteger itemslimit = 10;

@implementation msearch
{
    NSMutableArray *array;
}

-(instancetype)init:(id<msearchtypeprotocol>)searchtype mode:(id<msearchmodeprotocol>)searchmode
{
    self = [super init];
    
    self.searchtype = searchtype;
    self.searchmode = searchmode;
    self.limit = itemslimit;
    self.current = 0;
    self.offset = 0;
    array = [NSMutableArray array];
    
    NSMutableString *string = [NSMutableString string];
    [string appendString:[self.searchtype displayname]];
    [string appendFormat:@" %@ ", [self.searchmode displayname]];
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
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"category=%@", [[msettings singleton].country categoryforsettings]];
    [string appendString:@"&has_pictures=yes"];
    [string appendFormat:@"&limit=%@", @(self.limit)];
    [string appendFormat:@"&offset=%@&", @(self.offset)];
    [string appendString:[msettings singleton].location];
    
    return string;
}

-(void)join:(aparsersearch*)searchresults
{
    self.total = searchresults.total;
    self.offset += searchresults.limit;
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