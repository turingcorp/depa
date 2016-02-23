#import "msettings.h"

@implementation msettings

+(instancetype)singleton
{
    static msettings *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *settings = [defaults valueForKey:@"settings"];
    
    if(settings)
    {
        search_mode mode = (search_mode)[settings[@"searchmode"] unsignedIntegerValue];
        search_type type = (search_type)[settings[@"searchtype"] unsignedIntegerValue];
        
        [self loadsearchmode:mode];
        [self loadsearchtype:type];
    }
    else
    {
        search_mode mode = search_mode_rent;
        search_type type = search_type_apartment;
        [self loadsearchmode:mode];
        [self loadsearchtype:type];
        
        [self save];
    }
    
    return self;
}

#pragma mark functionality

-(void)loadsearchmode:(search_mode)type
{
    mconfigmod *mod = [[mconfigmod alloc] init];
    self.searchmode = [mod modewithtype:type];
}

-(void)loadsearchtype:(search_type)type
{
    mconfigtyp *typ = [[mconfigtyp alloc] init];
    self.searchtype = [typ itemwithtype:type];
}

#pragma mark public

-(void)save
{
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    settings[@"searchmode"] = @([self.searchmode type]);
    settings[@"searchtype"] = @([self.searchtype type]);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:settings forKey:@"settings"];
}

@end