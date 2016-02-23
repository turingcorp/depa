#import "appdel.h"

@class mcountryitemrent;
@class mcountryitembuy;

@interface mcountryitemhouse:NSObject

-(instancetype)init:(NSDictionary*)dictionary;

@property(strong, nonatomic)mcountryitemrent *rent;
@property(strong, nonatomic)mcountryitembuy *buy;

@end