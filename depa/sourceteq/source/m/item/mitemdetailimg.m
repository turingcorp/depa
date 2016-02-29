#import "mitemdetailimg.h"

@implementation mitemdetailimg
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

-(aimateqitem*)item:(NSUInteger)index
{
    aimateqitem *item = array[index];
    
    return item;
}

-(void)add:(NSArray*)urls
{
    
}

@end