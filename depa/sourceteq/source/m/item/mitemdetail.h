#import "appdel.h"

@class mitemdetailimg;

@interface mitemdetail:NSObject

-(instancetype)init:(NSString*)itemid;
-(void)changestatus:(item_status)status;

@property(strong, nonatomic)mitemdetailimg *images;
@property(copy, nonatomic)NSString *displaytitle;
@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSString *itemprice;
@property(copy, nonatomic)NSString *itemdesc;
@property(copy, nonatomic)NSString *itemaddress;
@property(copy, nonatomic)NSString *contactphone;
@property(copy, nonatomic)NSString *permalink;
@property(copy, nonatomic)NSNumber *latitude;
@property(copy, nonatomic)NSNumber *longitude;
@property(nonatomic)search_type type;
@property(nonatomic)search_mode mode;
@property(nonatomic)item_status status;
@property(nonatomic)NSUInteger dbid;
@property(nonatomic)NSUInteger meters;
@property(nonatomic)NSUInteger rooms;
@property(nonatomic)NSUInteger baths;
@property(nonatomic)NSUInteger garages;

@end