#import "mitemitem.h"

@implementation mitemitem

-(instancetype)init:(NSString*)itemid status:(item_status)status
{
    self = [super init];
    self.itemid = itemid;
    self.status = status;
    
    return self;
}

@end