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
            NSDictionary *itemresults =  results[i];
            
            
            
            
            /*
             
             self = [super init];
             
             self.itemid = rawitem[@"id"];
             self.itemprice = rawitem[@"price"];
             self.itemcurrency = rawitem[@"currency_id"];
             
             NSString *itemrawtitle = rawitem[@"title"];
             
             if(itemrawtitle.length > 1)
             {
             NSString *titleprefix = [itemrawtitle substringToIndex:1].uppercaseString;
             NSString *titlesuffix = [itemrawtitle substringFromIndex:1].lowercaseString;
             itemrawtitle = [NSString stringWithFormat:@"%@%@", titleprefix, titlesuffix];
             }
             
             self.itemtitle = itemrawtitle;
             
             NSString *thumbnail = rawitem[@"thumbnail"];
             thumbnail = [thumbnail stringByReplacingOccurrencesOfString:@"-I.jpg" withString:@"-O.jpg"];
             self.apiimage = [[aimateqitem alloc] init:thumbnail];
             
             */
            
            
            
            msearchresult *item = [[msearchresult alloc] init];
            
            [self.array addObject:item];
        }
        
        self.total = [paging[@"total"] unsignedIntegerValue];
        self.offset = [paging[@"offset"] unsignedIntegerValue];
        self.limit = [paging[@"limit"] unsignedIntegerValue];
    }
}

@end