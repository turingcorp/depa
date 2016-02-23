#import "sconfigloccountry.h"

@implementation sconfigloccountry

#pragma mark -
#pragma mark config loc del

-(void)items:(mconfigloclistitem*)item
{
    NSMutableArray *array = [NSMutableArray array];
    mcountry *countries = [[mcountry alloc] init];
    
    NSUInteger count = [countries count];
    for(NSUInteger i = 0; i < count; i++)
    {
        mcountryitem *countryitem = [countries item:i];
        mconfigloclistitem *item = [[mconfigloclistitem alloc] init];
        item.strategy = [[sconfiglocstate alloc] init];
        item.title = countryitem.countryname;
        item.country = countryitem;
        
        [array addObject:item];
    }
    
    [item returnfetch:array];
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_list_countries", nil);
    
    return title;
}

@end