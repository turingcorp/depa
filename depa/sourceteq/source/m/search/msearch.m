#import "msearch.h"

@implementation msearch
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
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
    
    [string appendString:@"has_pictures=yes&limit=1&offset=0&category=1479"];
    
    return string;
}

-(void)join:(aparsersearch*)searchresults
{
    self.total = searchresults.total;
    self.offset = searchresults.offset;
    self.limit = searchresults.limit;
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