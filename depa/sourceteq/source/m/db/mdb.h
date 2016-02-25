#import "appdel.h"

@interface mdb:NSObject

+(void)updatedb;
+(NSUInteger)add:(NSString*)itemid country:(NSString*)countryid status:(item_status)status thumbnail:(NSString*)thumbnail title:(NSString*)title currency:(NSString*)currency price:(NSNumber*)price rooms:(NSNumber*)rooms parking:(NSNumber*)parking phone:(NSString*)phone email:(NSString*)email latitude:(double)latitude longitude:(double)longitude;
+(NSNumber*)itemswitch:(item_status)status;
+(void)clear:(item_status)status;

@end