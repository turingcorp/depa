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
        self.highresolution = [settings[@"hr"] boolValue];
        self.fontselected = settings[@"fontname"];
        self.fontsize = [settings[@"fontsize"] unsignedIntegerValue];
    }
    else
    {
        self.highresolution = YES;
        self.fontselected = fontname;
        self.fontsize = 16;
        
        [self save];
    }
    
#warning @"high resolution is not working"
    
    return self;
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