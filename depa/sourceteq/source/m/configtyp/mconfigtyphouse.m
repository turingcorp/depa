#import "mconfigtyphouse.h"

@implementation mconfigtyphouse

#pragma mark -
#pragma mark typ protocol

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_type_house", nil);
    
    return title;
}

-(NSString*)assetname
{
    NSString *assetname = @"house";
    
    return assetname;
}

@end