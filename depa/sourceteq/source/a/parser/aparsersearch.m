#import "aparsersearch.h"

@implementation aparsersearch

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    self.pullagain = NO;
    
    if(self.validjson)
    {
        self.array = [NSMutableArray array];
        NSString *countryid = [msettings singleton].country.countryid;
        NSDictionary *paging = self.validjson[@"paging"];
        NSArray *results = self.validjson[@"results"];
        NSUInteger count = results.count;
        
        for(NSUInteger i = 0; i < count; i++)
        {
            mitemitem *item;
            NSDictionary *itemresults =  results[i];
            NSString *rawid = itemresults[@"id"];
            NSString *rawthumb;
            NSString *rawtitle;
            NSString *rawcurrency;
            NSString *rawphone;
            NSString *rawemail;
            NSNumber *rawprice;
            NSNumber *rawmeters;
            NSNumber *rawrooms;
            NSNumber *rawparking;
            NSNumber *rawlatitude;
            NSNumber *rawlongitude;
            
            item = [[mitem singleton] item:rawid];

            if(!item || item.status == item_status_none)
            {
                rawtitle = itemresults[@"title"];
                rawthumb = itemresults[@"thumbnail"];
                rawcurrency = itemresults[@"currency_id"];
                rawprice = itemresults[@"price"];
                
                if(rawtitle.length > 1)
                {
                    NSString *rawtitleprefix = [rawtitle substringToIndex:1].uppercaseString;
                    NSString *rawtitlesuffix = [rawtitle substringFromIndex:1].lowercaseString;
                    rawtitle = [NSString stringWithFormat:@"%@%@",
                                        rawtitleprefix, rawtitlesuffix];
                }
                
                rawthumb = [rawthumb stringByReplacingOccurrencesOfString:@"-I." withString:@"-O."];
                
                if(!item)
                {
                    NSUInteger dbid;
                    item_status status = item_status_none;
                    
                    [mdb add:rawid country:countryid status:status thumbnail:rawthumb title:rawtitle currency:rawcurrency price:rawprice meters:rawmeters rooms:<#(NSNumber *)#> parking:<#(NSNumber *)#> phone:<#(NSString *)#> email:<#(NSString *)#> latitude:<#(double)#> longitude:<#(double)#>];
                    
                    item = [[mitemitem alloc] init:dbid itemid:rawid status:status];
                    [[mitem singleton] add:item];
                }
                
                msearchresult *searchresult = [[msearchresult alloc] init];
                aimateqitem *rawimage = [[aimateqitem alloc] init:rawthumb];
                
                searchresult.item = item;
                searchresult.apiimage = rawimage;
                searchresult.itemtitle = rawtitle;
                searchresult.itemcurrency = rawcurrency;
                searchresult.itemprice = rawprice;

                [self.array addObject:searchresult];
            }
        }
        
        if(results.count && !self.array.count)
        {
            self.pullagain = YES;
        }
        
        self.total = [paging[@"total"] unsignedIntegerValue];
        self.offset = [paging[@"offset"] unsignedIntegerValue];
        self.limit = [paging[@"limit"] unsignedIntegerValue];
    }
}

@end