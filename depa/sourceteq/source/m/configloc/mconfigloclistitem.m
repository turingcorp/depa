#import "mconfigloclistitem.h"

@implementation mconfigloclistitem
{
    NSArray *array;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mconfigloclistitem*)item:(NSUInteger)index
{
    mconfigloclistitem *item = array[index];
    
    return item;
}

-(void)fetch
{
    [self.strategy items:self];
}

-(void)returnfetch:(NSArray*)returnarray
{
    array = returnarray;
    
    [self sort];
    [[NSNotificationCenter defaultCenter] postNotificationName:notloclistitemfetched object:nil];
}

-(void)sort
{
    array = [array sortedArrayUsingComparator:
    ^NSComparisonResult(mconfigloclistitem *item1, mconfigloclistitem *item2)
    {
        return [item1.title compare:item2.title];
    }];
}

@end