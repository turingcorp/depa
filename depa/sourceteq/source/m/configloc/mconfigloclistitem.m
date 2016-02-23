#import "mconfigloclistitem.h"

@implementation mconfigloclistitem
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    self.titletype = NSLocalizedString(@"config_location_list_countries", nil);
    self.countries = [[mcountry alloc] init];
    
    NSUInteger count = [self.countries count];
    for(NSUInteger i = 0; i < count; i++)
    {
        mcountryitem *item = [self.countries item:i];
        mconfigloclistitem *
        
        [array addObject:];
    }
    
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