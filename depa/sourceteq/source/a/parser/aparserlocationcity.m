#import "aparserlocationcity.h"

@implementation aparserlocationcity

-(void)parse:(NSDictionary*)json
{
    self.filterid = @"city";
    [super parse:json];
}

@end