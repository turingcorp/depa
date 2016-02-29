#import "mitemdetailinfo.h"

@implementation mitemdetailinfo
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

-(id<mitemdetailinfoprotocol>)item:(NSUInteger)index
{
    id<mitemdetailinfoprotocol> item = array[index];
    
    return item;
}

-(void)add:(id<mitemdetailinfoprotocol>)item
{
    [array addObject:item];
}

@end