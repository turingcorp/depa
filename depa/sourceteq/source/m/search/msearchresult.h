#import "appdel.h"

@interface msearchresult:NSObject

-(instancetype)init:(NSDictionary*)rawitem;

@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSString *itemthumbnail;
@property(copy, nonatomic)NSNumber *itemprice;

@end