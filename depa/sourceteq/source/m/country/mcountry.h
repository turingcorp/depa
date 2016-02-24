#import "appdel.h"

@class mcountryitem;

@interface mcountry:NSObject

+(instancetype)singleton;
-(NSUInteger)count;
-(mcountryitem*)item:(NSUInteger)index;
-(mcountryitem*)countryforid:(NSString*)countryid;

@end