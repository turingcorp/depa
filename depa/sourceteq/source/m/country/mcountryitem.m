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

@end