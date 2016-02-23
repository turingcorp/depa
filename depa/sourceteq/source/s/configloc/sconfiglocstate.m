#import "sconfiglocstate.h"

@implementation sconfiglocstate

-(void)dealloc
{
    [self.manager cancelcall];
}

#pragma mark -
#pragma mark config loc del

-(void)items:(mconfigloclistitem*)item
{
    amanager *manager = [amanager call:[[acalllocationstate alloc] init:item.country] delegate:self];
    self.manager = manager;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_list_state", nil);
    
    return title;
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    
}

@end