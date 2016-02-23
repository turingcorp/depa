#import "mconfigmodrent.h"

@implementation mconfigmodrent

#pragma mark -
#pragma mark config mode protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_mode_rent", nil);
    
    return title;
}

-(NSString*)assetname
{
    NSString *assetname = @"";
    
    return assetname;
}

@end