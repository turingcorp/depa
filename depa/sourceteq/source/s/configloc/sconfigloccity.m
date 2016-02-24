#import "sconfigloccity.h"

@implementation sconfigloccity

-(void)dealloc
{
    [self.manager cancelcall];
}

#pragma mark -
#pragma mark config loc del

-(void)items:(mconfigloclistitem*)item
{
    self.item = item;
    amanager *manager = [amanager call:[[acalllocationcity alloc] init:item] delegate:self];
    self.manager = manager;
}

-(NSString*)title
{
    NSString *title = NSLocalizedString(@"config_location_list_city", nil);
    
    return title;
}

-(NSString*)filterid
{
    NSString *filter = @"city";
    
    return filter;
}

-(void)nofilters:(NSDictionary*)json parser:(aparserlocation*)parser
{
    /*
    aparserlocation *newparser = [[[self.item.strategyinstance optionalparser] alloc] init:self.item];
    [newparser parse:json];
    self.array = newparser.array;*/
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