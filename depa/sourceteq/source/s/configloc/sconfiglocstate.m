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
    amanager *callmanager = [amanager call:[[acallsearch alloc] init:[self.play.model variables]] delegate:self];
    self.callmanager = callmanager;
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