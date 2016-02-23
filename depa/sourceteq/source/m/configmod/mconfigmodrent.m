#import "mconfigmodrent.h"

@implementation mconfigmodrent

#pragma mark -
#pragma mark config mode protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_mode_rent", nil);
    
    return title;
}

-(search_mode)type
{
    return search_mode_rent;
}

@end