#import "appdel.h"

@class mdbitem;

@interface mdb:NSObject

+(void)updatedb;
+(NSUInteger)add:(mdbitem*)item;
+(NSArray*)allitemsfor:(item_status)status;
+(NSNumber*)itemsfor:(item_status)status;
+(NSNumber*)newitems;
+(void)clearviewed;
+(void)clear:(item_status)status;

@end