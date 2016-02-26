#import "appdel.h"

@interface mdbitem:NSObject

@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *countryid;
@property(copy, nonatomic)NSString *thumbnail;
@property(copy, nonatomic)NSString *title;
@property(copy, nonatomic)NSString *currency;
@property(copy, nonatomic)NSString *phone;
@property(copy, nonatomic)NSString *email;
@property(copy, nonatomic)NSNumber *dbid;
@property(copy, nonatomic)NSNumber *price;
@property(copy, nonatomic)NSNumber *meters;
@property(copy, nonatomic)NSNumber *rooms;
@property(copy, nonatomic)NSNumber *parking;
@property(nonatomic)item_status status;
@property(nonatomic)search_mode mode;
@property(nonatomic)search_type type;
@property(nonatomic)double latitude;
@property(nonatomic)double longitude;
@property(nonatomic)NSUInteger created;

@end