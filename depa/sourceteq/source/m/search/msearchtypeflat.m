#import "msearchtypeflat.h"

@implementation msearchtypeflat

#pragma mark -
#pragma mark search protocol

-(NSString*)displayname
{
    NSString *name = NSLocalizedString(@"search_type_flat", nil);
    
    return name;
}

@end