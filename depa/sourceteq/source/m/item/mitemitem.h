#import "appdel.h"

@interface mitemitem:NSObject

-(instancetype)init:(NSString*)itemid status:(item_status)status;

@property(copy, nonatomic)NSString *itemid;
@property(nonatomic)item_status status;

@end