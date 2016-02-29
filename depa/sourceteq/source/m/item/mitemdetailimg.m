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
    NSUInteger count = urls.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSString *url = urls[i];
        aimateqitem *image = [[aimateqitem alloc] init:url];
        [array addObject:image];
    }
}

@end