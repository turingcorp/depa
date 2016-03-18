#import "aparseritem.h"

@implementation aparseritem

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
  
    self.picturesarray = [NSMutableArray array];
    self.rooms = 0;
    self.meters = 0;
    self.garages = 0;
    
    if(self.validjson)
    {
        self.itemtitle = [tools cleanlatin:self.validjson[@"title"]];
        self.itemcurrency = self.validjson[@"currency_id"];
        self.itemprice = self.validjson[@"price"];
        self.itempermalink = self.validjson[@"permalink"];
        NSArray *jsonpictures = self.validjson[@"pictures"];
        NSArray *rawattributes = self.validjson[@"attributes"];
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
        
        if(rawattributes)
        {
            aparsersearchatt *attributes = [[aparsersearchatt alloc] init:rawattributes];
            aparsersearchattitem *attmeters = [attributes itemfor:search_attr_mtrs];
            aparsersearchattitem *attrooms = [attributes itemfor:search_attr_rooms];
            aparsersearchattitem *attgarage = [attributes itemfor:search_attr_garage];
            
            if(attmeters)
            {
                NSInteger rawmeters = attmeters.value.integerValue;
                
                if(rawmeters > 0)
                {
                    self.meters = rawmeters;
                }
            }
            
            if(attrooms)
            {
                NSInteger rawrooms = attrooms.value.integerValue;
                
                if(rawrooms > 0)
                {
                    self.rooms = rawrooms;
                }
            }
            
            if(attgarage)
            {
                NSInteger rawgarage = attgarage.value.integerValue;
                
                if(rawgarage > 0)
                {
                    self.garages = rawgarage;
                }
            }
        }
        
        if(rawlocation)
        {
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
            
            if(rawaddressline && rawaddressline.length > 1)
            {
                [mutlocation appendString:rawaddressline];
            }
            
            if(rawneightname && rawneightname.length > 1)
            {
                [mutlocation appendFormat:@"\n%@", rawneightname];
            }
            
            if(rawcityname && rawcityname.length > 1)
            {
                [mutlocation appendFormat:@"\n%@", rawcityname];
            }
            
            if(rawstatename && rawstatename.length > 1)
            {
                [mutlocation appendFormat:@", %@", rawstatename];
            }
            
            if(rawcountryname && rawcountryname.length > 1)
            {
                [mutlocation appendFormat:@", %@", rawcountryname];
            }
            
            if(rawzipcode && rawzipcode.length > 1)
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
}

@end