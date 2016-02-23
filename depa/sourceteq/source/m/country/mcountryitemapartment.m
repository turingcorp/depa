#import "mcountryitemapartment.h"

@implementation mcountryitemapartment

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    NSString *rawbuy = dictionary[@"buy"];
    NSString *rawrent = dictionary[@"rent"];
    self.buy = [[mcountryitembuy alloc] init:rawbuy];
    self.rent = [[mcountryitemrent alloc] init:rawrent];
    
    return self;
}

@end