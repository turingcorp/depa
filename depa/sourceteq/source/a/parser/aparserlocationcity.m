#import "aparserlocationcity.h"

@implementation aparserlocationcity

-(void)parse:(NSDictionary*)json
{
    self.strategy = [sconfiglocneigh class];
    [super parse:json];
}

@end