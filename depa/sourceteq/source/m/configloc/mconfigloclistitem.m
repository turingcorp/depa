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
    [[NSNotificationCenter defaultCenter] postNotificationName:notloclistitemfetched object:nil];
}

@end