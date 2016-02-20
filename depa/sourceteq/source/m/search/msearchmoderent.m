#import "msearchmoderent.h"

@implementation msearchmoderent

#pragma mark -
#pragma mark search mode protocol

-(NSString*)displayname
{
    NSString *name = NSLocalizedString(@"search_mode_rent", nil);
    
    return name;
}

@end