#import "mconfigloclistitem.h"

@implementation mconfigloclistitem
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    
    
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

@end