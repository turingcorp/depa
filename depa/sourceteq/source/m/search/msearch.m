#import "msearch.h"

@implementation msearch
{
    NSMutableArray *array;
}

-(instancetype)init:(id<msearchtypeprotocol>)searchtype
{
    self = [super init];
    
    self.searchtype = searchtype;
    self.limit = 10;
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
    
    if([self count])
    {
        item = [self item:0];
        [self remove:0];
    }
    
    return item;
}

@end