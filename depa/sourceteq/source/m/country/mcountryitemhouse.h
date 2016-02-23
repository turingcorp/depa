#import "appdel.h"

@interface mcountryitemhouse:NSObject

-(instancetype)init:(NSDictionary*)dictionary;

@property(strong, nonatomic)mcountryitemrent *rent;
@property(strong, nonatomic)mcountryitembuy *buy;

@end