#import "mitemitem.h"

@implementation mitemitem

-(instancetype)init:(NSUInteger)dbid itemid:(NSString*)itemid status:(item_status)status
{
    self = [super init];
    self.dbid = dbid;
    self.itemid = itemid;
    self.status = status;
    
    return self;
}

#pragma mark public

-(void)changestatus:(item_status)status
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       self.status = status;
                       
                       NSString *query = [NSString stringWithFormat:
                                          @"UPDATE item SET status=%@ "
                                          "WHERE id=%@;",
                                          @(status), @(self.dbid)];
                       [db query:query];
                   });
}

@end