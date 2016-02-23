#import "sconfigloccountry.h"

@implementation sconfigloccountry

#pragma mark -
#pragma mark config loc del

-(NSArray*)items
{
    NSMutableArray *array = [NSMutableArray array];
    mcountry *countries = [[mcountry alloc] init];
    
    NSUInteger count = [countries count];
    for(NSUInteger i = 0; i < count; i++)
    {
        mcountryitem *countryitem = [countries item:i];
        mconfigloclistitem *item = [[mconfigloclistitem alloc] init];
        
        [array addObject:item];
    }
    
    return array;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_list_countries", nil);
    
    return title;
}

@end