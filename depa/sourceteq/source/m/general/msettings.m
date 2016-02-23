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
        [self loadsearchmode:mode];
    }
    else
    {
        search_mode mode = search_mode_rent;
        [self loadsearchmode:mode];
        
        [self save];
    }
    
    return self;
}

#pragma mark functionality

-(void)loadsearchmode:(search_mode)mode
{
    
}

#pragma mark public

-(void)save
{
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    settings[@"hr"] = @(self.highresolution);
    settings[@"fontname"] = self.fontselected;
    settings[@"fontsize"] = @(self.fontsize);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:settings forKey:@"settings"];
}

@end