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
        NSDictionary *rawlocation = self.validjson[@"location"];
        NSMutableString *mutlocation = [NSMutableString string];
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
        
        NSString *rawaddressline = rawlocation[@"address_line"];
        NSString *rawzipcode = rawlocation[@"zip_code"];
        NSNumber *rawlatitude = rawlocation[@"latitude"];
        NSNumber *rawlongitude = rawlocation[@"longitude"];
        NSDictionary *rawneight = rawlocation[@"neighborhood"];
        NSString *rawneightname;
        NSDictionary *rawcity = rawlocation[@"city"];
        NSString *rawcityname;
        NSDictionary *rawstate = rawlocation[@"state"];
        NSString *rawstatename;
        NSDictionary *rawcountry = rawlocation[@"country"];
        NSString *rawcountryname;
        
        if(rawneight)
        {
            rawneightname = rawneight[@"name"];
        }
        
        if(rawcity)
        {
            rawcityname = rawcity[@"name"];
        }
        
        if(rawstate)
        {
            rawstatename = rawstate[@"name"];
        }
        
        if(rawcountry)
        {
            rawcountryname = rawcountry[@"name"];
        }
        
        if(rawaddressline)
        {
            [mutlocation appendString:rawaddressline];
        }
        
        if(rawneightname)
        {
            [mutlocation appendFormat:@"\n%@", rawneightname];
        }
        
        if(rawcityname)
        {
            [mutlocation appendFormat:@"\n%@", rawcityname];
        }
        
        if(rawstatename)
        {
            [mutlocation appendFormat:@", %@", rawstatename];
        }
        
        if(rawcountryname)
        {
            [mutlocation appendFormat:@", %@", rawcountryname];
        }
        
        if(rawzipcode)
        {
            [mutlocation appendFormat:@"\n%@", rawzipcode];
        }
        
        self.itemaddress = mutlocation;
        
        if(rawlatitude && rawlatitude.doubleValue != 0 && rawlongitude && rawlongitude.doubleValue)
        {
            self.latitude = rawlatitude;
            self.longitude = rawlongitude;
        }
    }
}

@end