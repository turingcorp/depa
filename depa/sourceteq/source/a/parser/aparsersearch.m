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
        search_type type = [[msettings singleton].searchtype type];
        search_mode mode = [[msettings singleton].searchmode type];
        
        for(NSUInteger i = 0; i < count; i++)
        {
            mitemitem *item;
            NSDictionary *itemresults =  results[i];
            NSDictionary *rawaddress;
            NSDictionary *rawlocation;
            NSArray *rawattributes;
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
            double rawlatitude = 0;
            double rawlongitude = 0;
            
            item = [[mitem singleton] item:rawid];
            
            if(!item || item.status == item_status_none)
            {
                rawtitle = [tools cleanlatin:itemresults[@"title"]];
                rawtitle = [tools capitalfirst:rawtitle];
                rawthumb = itemresults[@"thumbnail"];
                rawcurrency = itemresults[@"currency_id"];
                rawprice = itemresults[@"price"];
                rawthumb = [rawthumb stringByReplacingOccurrencesOfString:@"-I." withString:@"-O."];
                
                if(!item)
                {
                    NSUInteger dbid;
                    item_status status = item_status_none;
                    rawattributes = itemresults[@"attributes"];
                    rawaddress = itemresults[@"address"];
                    rawlocation = itemresults[@"location"];
                    aparsersearchatt *attributes = [[aparsersearchatt alloc] init:rawattributes];
                    aparsersearchattitem *attmeters = [attributes itemfor:search_attr_mtrs];
                    aparsersearchattitem *attrooms = [attributes itemfor:search_attr_rooms];
                    
                    if(attmeters)
                    {
                        NSUInteger integermeters = attmeters.value.integerValue;
                        rawmeters = @(integermeters);
                    }
                    
                    if(attrooms)
                    {
                        NSUInteger integerrooms = attrooms.value.integerValue;
                        rawrooms = @(integerrooms);
                    }
                    
                    if(rawaddress)
                    {
                        NSString *rawinphone1 = rawaddress[@"phone1"];
                        
                        if(rawinphone1 && rawinphone1.length > 1)
                        {
                            rawphone = rawinphone1;
                        }
                    }
                    
                    if(rawlocation)
                    {
                        NSNumber *rawinlatitude = rawlocation[@"latitude"];
                        NSNumber *rawinlongitude = rawlocation[@"longitude"];
                        
                        if(rawinlatitude && rawinlongitude)
                        {
                            rawlatitude = rawinlatitude.doubleValue;
                            rawlongitude = rawinlongitude.doubleValue;
                        }
                    }
                    
                    if(!rawmeters)
                    {
                        rawmeters = @(0);
                    }
                    
                    if(!rawrooms)
                    {
                        rawrooms = @(0);
                    }
                    
                    if(!rawparking)
                    {
                        rawparking = @(0);
                    }
                    
                    if(!rawphone)
                    {
                        rawphone = @"";
                    }
                    
                    if(!rawemail)
                    {
                        rawemail = @"";
                    }
                    
                    mdbitem *dbitem = [[mdbitem alloc] init];
                    dbitem.itemid = rawid;
                    dbitem.countryid = countryid;
                    dbitem.thumbnail = rawthumb;
                    dbitem.title = rawtitle;
                    dbitem.currency = rawcurrency;
                    dbitem.price = rawprice;
                    dbitem.meters = rawmeters;
                    dbitem.rooms = rawrooms;
                    dbitem.parking = rawparking;
                    dbitem.phone = rawphone;
                    dbitem.email = rawemail;
                    dbitem.latitude = rawlatitude;
                    dbitem.longitude = rawlongitude;
                    dbitem.status = status;
                    dbitem.mode = mode;
                    dbitem.type = type;
                    
                    dbid = [mdb add:dbitem];
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
                searchresult.phone = rawphone;
                
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