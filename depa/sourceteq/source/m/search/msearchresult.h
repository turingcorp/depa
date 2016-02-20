#import "appdel.h"

@class msearch;
@class aimateqitem;

@interface msearchresult:NSObject

-(instancetype)init:(NSDictionary*)rawitem;

@property(weak, nonatomic)msearch *search;
@property(strong, nonatomic)aimateqitem *apiimage;
@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSNumber *itemprice;

@end