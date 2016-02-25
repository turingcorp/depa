#import "aparsersearch.h"

@implementation aparsersearch

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        self.array = [NSMutableArray array];
        NSDictionary *paging = self.validjson[@"paging"];
        NSArray *results = self.validjson[@"results"];
        NSUInteger count = results.count;
        
        for(NSUInteger i = 0; i < count; i++)
        {
            mitemitem *item;
            NSDictionary *itemresults =  results[i];
            NSString *iditemresults = itemresults[@"id"];
            item = [[mitem singleton] item:iditemresults];
            
            if(!item)
            {
                item = [[mitem singleton] newitem:iditemresults];
            }
            
            if(item.status == item_status_none)
            {
                msearchresult *searchresult = [[msearchresult alloc] init];
                NSString *currencyitemresults = itemresults[@"currency_id"];
                NSString *titleitemresults = itemresults[@"title"];
                NSString *thumbitemresults = itemresults[@"thumbnail"];
                NSNumber *priceitemresults = itemresults[@"price"];
                aimateqitem *rawimage;
                
                if(titleitemresults.length > 1)
                {
                    NSString *rawtitleprefix = [titleitemresults substringToIndex:1].uppercaseString;
                    NSString *rawtitlesuffix = [titleitemresults substringFromIndex:1].lowercaseString;
                    titleitemresults = [NSString stringWithFormat:@"%@%@",
                                        rawtitleprefix, rawtitlesuffix];
                }
                
                thumbitemresults = [thumbitemresults stringByReplacingOccurrencesOfString:@"I.jpg" withString:@"O.jpg"];
                rawimage = [[aimateqitem alloc] init:thumbitemresults];
                
                searchresult.item = item;
                searchresult.apiimage = rawimage;
                searchresult.itemtitle = titleitemresults;
                searchresult.itemcurrency = currencyitemresults;
                searchresult.itemprice = priceitemresults;

                [self.array addObject:searchresult];
            }
        }
        
        self.total = [paging[@"total"] unsignedIntegerValue];
        self.offset = [paging[@"offset"] unsignedIntegerValue];
        self.limit = [paging[@"limit"] unsignedIntegerValue];
    }
}

@end