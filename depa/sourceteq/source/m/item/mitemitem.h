#import "appdel.h"

@interface mitemitem:NSObject

-(instancetype)init:(NSString*)dbid itemid:(NSString*)itemid status:(item_status)status;

@property(copy, nonatomic)NSString *dbid;
@property(copy, nonatomic)NSString *itemid;
@property(nonatomic)item_status status;

@end