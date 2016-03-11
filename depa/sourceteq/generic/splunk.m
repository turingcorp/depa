#import "splunk.h"

@implementation splunk

+(void)start
{
    [[Mint sharedInstance] initAndStartSession:[Interface singleton].splunkMintApiKey];
}

@end