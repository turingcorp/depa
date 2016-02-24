#import "sconfigloccountry.h"

@implementation sconfigloccountry

#pragma mark -
#pragma mark config loc del

-(void)items:(mconfigloclistitem*)itemparent
{
    NSMutableArray *array = [NSMutableArray array];
    NSUInteger count = [[mcountry singleton] count];
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mcountryitem *countryitem = [[mcountry singleton] item:i];
        mconfigloclistitem *item = [[mconfigloclistitem alloc] init:countryitem];
        item.parent = itemparent;
        item.strategy = [sconfiglocstate class];
        item.title = countryitem.countryname;
        
        [array addObject:item];
    }
    
    [itemparent returnfetch:array];
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_list_countries", nil);
    
    return title;
}

@end