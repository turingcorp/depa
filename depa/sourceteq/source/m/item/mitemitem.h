#import "appdel.h"

@interface mitemitem:NSObject

-(instancetype)init:(NSUInteger)dbid itemid:(NSString*)itemid status:(item_status)status thumbnail:(NSString*)thumbnail;
-(void)changestatus:(item_status)status;

@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *thumbnail;
@property(nonatomic)item_status status;
@property(nonatomic)NSUInteger dbid;

@end