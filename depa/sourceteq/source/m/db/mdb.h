#import "appdel.h"

@class mdbitem;

@interface mdb:NSObject

+(void)updatedb;
+(NSUInteger)add:(mdbitem*)item;
+(NSArray*)itemsfor:(item_status)status;
+(NSNumber*)itemsfor:(item_status)status;
+(void)clear:(item_status)status;

@end