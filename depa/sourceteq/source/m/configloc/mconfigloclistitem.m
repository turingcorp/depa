#import "mconfigloclistitem.h"

@implementation mconfigloclistitem
{
    NSArray *array;
}

-(instancetype)init:(mcountryitem*)country
{
    self = [super init];
    
    self.country = country;
    
    return self;
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
    self.strategyinstance = [[self.strategy alloc] init];
    [self.strategyinstance items:self];
}

-(void)returnfetch:(NSArray*)returnarray
{
    self.error = nil;
    array = returnarray;
    
    [self sort];
    [[NSNotificationCenter defaultCenter] postNotificationName:notloclistitemfetched object:nil];
}

-(void)returnerror:(NSString*)error
{
    self.error = error;
    array = nil;
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