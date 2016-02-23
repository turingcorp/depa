#import "mcountry.h"

@implementation mcountry
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"country" withExtension:@"plist"]];
    
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