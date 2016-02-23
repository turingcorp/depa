#import "mcountry.h"

@implementation mcountry
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    NSArray *rawarray = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"country" withExtension:@"plist"]];
    NSUInteger count = rawarray.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawitem = rawarray[i];
        mcountryitem *item = [[mcountryitem alloc] init:rawitem];
        [array addObject:item];
    }
    
    [array sortedArrayUsingComparator:
     ^NSComparisonResult(mcountryitem *item1, mcountryitem *item2)
    {
        return [item1.countryname compare:item2.countryname];
    }];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mcountryitem*)item:(NSUInteger)index
{
    mcountryitem *item = array[index];
    
    return item;
}

@end