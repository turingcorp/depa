#import "appdel.h"

@class aimateqitem;

@interface msearchresult:NSObject

-(instancetype)init:(NSDictionary*)rawitem;

@property(strong, nonatomic)aimateqitem *apiimage;
@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSNumber *itemprice;

@end