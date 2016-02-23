#import "appdel.h"

@class mcountryitemrent;
@class mcountryitembuy;

@interface mcountryitemapartment:NSObject

-(instancetype)init:(NSDictionary*)dictionary;
-(NSString*)categoryformode:(search_mode)mode;

@property(strong, nonatomic)mcountryitemrent *rent;
@property(strong, nonatomic)mcountryitembuy *buy;

@end