#import "aparserlocationstate.h"

@implementation aparserlocationstate

-(void)parse:(NSDictionary*)json
{
    self.filterid = @"state";
    [super parse:json];
}

@end