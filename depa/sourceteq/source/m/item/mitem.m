#import "mitem.h"

@implementation mitem
{
    NSArray *array;
}

-(instancetype)init:(NSString*)countryid
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

-(mitemitem*)item:(NSUInteger)index
{
    mitemitem *item = array[index];
    
    return item;
}

@end