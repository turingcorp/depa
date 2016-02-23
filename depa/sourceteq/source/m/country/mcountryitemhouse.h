#import "appdel.h"

@class mcountryitemrent;
@class mcountryitembuy;

@interface mcountryitemhouse:NSObject

-(instancetype)init:(NSDictionary*)dictionary;
-(NSString*)categoryformode:(search_mode)mode;

@property(strong, nonatomic)mcountryitemrent *rent;
@property(strong, nonatomic)mcountryitembuy *buy;

@end