#import "mconfigmodbuy.h"

@implementation mconfigmodbuy

#pragma mark -
#pragma mark config mode protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_mode_buy", nil);
    
    return title;
}

-(search_mode)type
{
    return search_mode_buy;
}

@end