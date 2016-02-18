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

@end