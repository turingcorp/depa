#import "msearchresult.h"

@implementation msearchresult

-(instancetype)init:(mitemitem*)item
{
    self = [super init];
    self.item = item;
    
    return self;
}

#pragma mark public

-(void)playlike
{
    [self.item changestatus:item_status_like];
}

-(void)playno
{
    [self.item changestatus:item_status_no];
}

@end