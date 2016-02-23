#import "appdel.h"

@interface mcountryitemapartment:NSObject

-(instancetype)init:(NSDictionary*)dictionary;

@property(strong, nonatomic)mcountryitemrent *rent;
@property(strong, nonatomic)mcountryitembuy *buy;

@end