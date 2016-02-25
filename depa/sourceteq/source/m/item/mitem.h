#import "appdel.h"

@class mitemitem;

@interface mitem:NSObject

+(instancetype)singleton;
-(void)load:(NSString*)countryid;
-(void)add:(mitemitem*)item;
-(mitemitem*)item:(NSString*)itemid;

@property(copy, nonatomic)NSString *countryid;

@end