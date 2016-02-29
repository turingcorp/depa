#import "aparseritem.h"

@implementation aparseritem

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    self.picturesarray = [NSMutableArray array];
    
    if(self.validjson)
    {
        self.itemtitle = self.validjson[@"title"];
        self.itemcurrency = self.validjson[@"currency_id"];
        self.itemprice = self.validjson[@"price"];
        NSArray *jsonpictures = self.validjson[@"pictures"];
        NSUInteger count = jsonpictures.count;
        
        for(NSUInteger i = 0; i < count; i++)
        {
            NSDictionary *rawpicture = jsonpictures[i];
            NSString *imageurl = rawpicture[@"url"];
            
            if(imageurl)
            {
                [self.picturesarray addObject:imageurl];
            }
        }
    }
}

@end