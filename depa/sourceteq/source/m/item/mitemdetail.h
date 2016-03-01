#import "appdel.h"

@class mitemdetailimg;

@interface mitemdetail:NSObject

-(instancetype)init:(NSString*)itemid type:(search_type)type mode:(search_mode)mode;

@property(strong, nonatomic)mitemdetailimg *images;
@property(copy, nonatomic)NSString *displaytitle;
@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSString *itemprice;
@property(copy, nonatomic)NSString *itemdesc;
@property(copy, nonatomic)NSString *itemaddress;
@property(copy, nonatomic)NSNumber *latitude;
@property(copy, nonatomic)NSNumber *longitude;
@property(nonatomic)search_type type;
@property(nonatomic)search_mode mode;

@end