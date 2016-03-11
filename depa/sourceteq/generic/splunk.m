#import "splunk.h"

@implementation splunk

+(void)start
{
    [[Mint sharedInstance] initAndStartSession:splunkid];
}

@end