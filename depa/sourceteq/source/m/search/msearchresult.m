#import "msearchresult.h"

@implementation msearchresult

-(instancetype)init:(mitemitem*)item
{
    self = [super init];
    self.item = item;
    
    return self;
}

@end