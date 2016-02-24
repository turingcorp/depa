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
    self.item = item;
    amanager *manager = [amanager call:[[acalllocationstate alloc] init:item] delegate:self];
    self.manager = manager;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_list_state", nil);
    
    return title;
}

-(NSString*)filterid
{
    NSString *filter = @"state";
    
    return filter;
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    aparserlocation *parser = (aparserlocation*)manager.call.parser;
    [self.item returnfetch:parser.array];
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    [self.item returnerror:error];
}

@end