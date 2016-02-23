#import "appdel.h"

@class mcountryitemapartment;
@class mcountryitemhouse;

@interface mcountryitem:NSObject

-(instancetype)init:(NSDictionary*)dictionary;

@property(strong, nonatomic)mcountryitemhouse *house;
@property(strong, nonatomic)mcountryitemapartment *apartment;
@property(copy, nonatomic)NSString *countryid;
@property(copy, nonatomic)NSString *countryname;

@end