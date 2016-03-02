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
    NSString *countryid;
    search_mode mode;
    search_type type;
    search_order order;
    
    if(settings)
    {
        countryid = settings[@"countryid"];
        mode = (search_mode)[settings[@"searchmode"] unsignedIntegerValue];
        type = (search_type)[settings[@"searchtype"] unsignedIntegerValue];
        order = (search_order)[settings[@"searchorder"] unsignedIntegerValue];
        self.location = settings[@"location"];
        self.locationname = settings[@"locationname"];
    }
    else
    {
        countryid = @"MLM";
        mode = search_mode_rent;
        type = search_type_apartment;
        order = search_order_lower;
        self.location = @"state=TUxNUERJUzYwOTQ&";
        self.locationname = NSLocalizedString(@"settings_original_locationname", nil);
    }
    
    [self loadsearchmode:mode];
    [self loadsearchtype:type];
    [self loadsearchorder:order];
    [self loadcountry:countryid];
    
    if(!settings)
    {
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

-(void)loadsearchorder:(search_order)order
{
    mconfigsor *sor = [[mconfigsor alloc] init];
    self.searchorder = [sor itemwithtype:order];
}

-(void)loadcountry:(NSString*)countryid
{
    mcountryitem *country = [[mcountry singleton] countryforid:countryid];
    [self changecountry:country];
}

-(void)changecountry:(mcountryitem*)country
{
    self.country = country;
    [[mitem singleton] load:country.countryid];
}

#pragma mark public

-(void)save
{
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    settings[@"searchmode"] = @([self.searchmode type]);
    settings[@"searchtype"] = @([self.searchtype type]);
    settings[@"searchorder"] = @([self.searchorder type]);
    settings[@"countryid"] = self.country.countryid;
    settings[@"location"] = self.location;
    settings[@"locationname"] = self.locationname;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:settings forKey:@"settings"];
}

-(void)changecountry:(mcountryitem*)country location:(NSString*)location locationname:(NSString*)locationname
{
    self.location = location;
    self.locationname = locationname;
    [self changecountry:country];
    
    [self save];
}

@end