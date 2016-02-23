#import "mcountryitembuy.h"

@implementation mcountryitembuy

-(instancetype)init:(NSString*)categoryid
{
    self = [super init];
    self.categoryid = categoryid;
    
    return self;
}

@end