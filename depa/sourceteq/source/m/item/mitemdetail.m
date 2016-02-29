#import "mitemdetail.h"

@implementation mitemdetail

-(instancetype)init:(NSString*)itemid type:(search_type)type mode:(search_mode)mode
{
    self = [super init];
    
    self.itemid = itemid;
    self.mode = mode;
    self.type = type;
    self.images = [[mitemdetailimg alloc] init];
    
    return self;
}

@end