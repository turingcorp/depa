#import "msearch.h"

@implementation msearch
{
    NSMutableArray *array;
}

-(instancetype)init:(id<msearchtypeprotocol>)searchtype mode:(id<msearchmodeprotocol>)searchmode
{
    self = [super init];
    
    self.searchtype = searchtype;
    self.searchmode = searchmode;
    self.limit = 10;
    self.current = 0;
    array = [NSMutableArray array];
    
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
    [string appendString:@"category=1479&has_pictures=yes"];
    [string appendFormat:@"&limit=%@", @(self.limit)];
    [string appendFormat:@"&offset=%@", @(self.offset)];
    
    return string;
}

-(void)join:(aparsersearch*)searchresults
{
    self.total = searchresults.total;
    self.offset = searchresults.offset;
    [array addObjectsFromArray:searchresults.array];
}

-(msearchresult*)next
{
    msearchresult *item;
    self.current = 0;
    
    if([self count])
    {
        item = [self item:0];
        [self remove:0];
    }
    
    return item;
}

-(NSString*)displayname
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:[self.searchtype displayname]];
    [string appendFormat:@" %@", [self.searchmode displayname]];
    [string appendFormat:@" %@/%@", [[tools singleton] numbertostring:@(self.current)], [[tools singleton] numbertostring:@(self.total)]];
    
    return string;
}

@end