#import "mcountry.h"

@implementation mcountry
{
    NSMutableArray *array;
}

+(instancetype)singleton
{
    static mcountry *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    NSArray *rawarray = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"country" withExtension:@"plist"]];
    NSUInteger count = rawarray.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawitem = rawarray[i];
        mcountryitem *item = [[mcountryitem alloc] init:rawitem];
        [array addObject:item];
    }
    
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

-(mcountryitem*)countryforid:(NSString*)countryid
{
    mcountryitem *country;
    NSUInteger count = [self count];
    
    for(NSUInteger i = 0; i < count; i++)
    {
        country = [self item:i];
        
        if([country.countryid isEqualToString:countryid])
        {
            break;
        }
    }
    
    return country;
}

-(mcountryitem*)countryforname:(NSString*)name
{
    mcountryitem *country;
    NSUInteger count = [self count];
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mcountryitem *incountry = [self item:i];
        
        if([incountry.countryname.lowercaseString isEqualToString:name])
        {
            country = incountry;
            
            break;
        }
    }
    
    return country;
}

-(mcountryitem*)countrydefault
{
    return [self countryforid:@"MLM"];
}

@end