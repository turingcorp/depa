#import "mcountryitemrent.h"

@implementation mcountryitemrent

-(instancetype)init:(NSString*)categoryid
{
    self = [super init];
    self.categoryid = categoryid;
    
    return self;
}

@end