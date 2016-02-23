#import "mcountryitem.h"

@implementation mcountryitem

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    NSString *rawid = dictionary[@"id"];
    NSString *rawname = dictionary[@"name"];
    NSDictionary *rawapartment = dictionary[@"apartment"];
    NSDictionary *rawhouse = dictionary[@"house"];
    self.countryid = rawid;
    self.countryname = rawname;
    self.apartment = [[mcountryitemapartment alloc] init:rawapartment];
    self.house = [[mcountryitemhouse alloc] init:rawhouse];
    
    return self;
}

#pragma mark public

-(NSString*)categoryforsettings
{
    NSString *categoryid;
    search_type type = [[msettings singleton].searchtype type];
    search_mode mode = [[msettings singleton].searchmode type];
    
    switch(type)
    {
        case search_type_apartment:
            
            categoryid = [self.apartment categoryformode:mode];
            
            break;
            
        case search_type_house:
            
            categoryid = [self.house categoryformode:mode];
            
            break;
    }
    
    return categoryid;
}

@end