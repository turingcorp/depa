#import "mitemdetail.h"

@implementation mitemdetail

-(instancetype)init:(NSString*)itemid
{
    self = [super init];
    
    self.itemid = itemid;
    self.images = [[mitemdetailimg alloc] init];
    self.meters = 0;
    self.rooms = 0;
    self.garages = 0;
    
    return self;
}

@end