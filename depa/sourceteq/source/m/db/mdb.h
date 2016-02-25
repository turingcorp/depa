#import "appdel.h"

@interface mdb:NSObject

+(void)updatedb;
+(NSNumber*)itemswith:(item_status)status;
+(void)clear:(item_status)status;

@end