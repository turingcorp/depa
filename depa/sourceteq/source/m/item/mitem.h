#import "appdel.h"

@class mitemitem;

@interface mitem:NSObject

+(instancetype)singleton;
-(void)load:(NSString*)countryid;
-(void)insideload;
-(mitemitem*)newitem:(NSString*)itemid thumbnail:(NSString*)thumbnail;
-(void)add:(mitemitem*)item;
-(mitemitem*)item:(NSString*)itemid;

@property(copy, nonatomic)NSString *countryid;

@end