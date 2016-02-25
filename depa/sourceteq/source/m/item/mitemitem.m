#import "mitemitem.h"

@implementation mitemitem

-(instancetype)init:(NSString*)dbid itemid:(NSString*)temid status:(item_status)status
{
    self = [super init];
    self.dbid = dbid;
    self.itemid = itemid;
    self.status = status;
    
    return self;
}

@end