#import "aparserlocationstate.h"

@implementation aparserlocationstate

-(void)parse:(NSDictionary*)json
{
    self.strategy = [sconfigloccity class];
    [super parse:json];
}

@end