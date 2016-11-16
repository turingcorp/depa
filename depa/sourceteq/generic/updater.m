#import "updater.h"

@implementation updater

NSString *documents;

+(void)launch
{
    [[analytics singleton] start];
    [splunk start];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 100), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       BOOL firstime = [updater update];
                       [[msettings singleton] loadsettings];
                       
                       if(firstime)
                       {
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [[cmain singleton] pushViewController:[[cconfigloc alloc] init] animated:YES];
                                          });
                       }
                   });
}

#pragma mark private

+(BOOL)update
{
    BOOL firstime = NO;
    
    documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSDictionary *defaults = [tools defaultdict];
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSInteger def_version = [defaults[@"version"] integerValue];
    NSInteger pro_version = [[properties valueForKey:@"version"] integerValue];
    
    if(def_version != pro_version)
    {
        [properties setValue:@(def_version) forKeyPath:@"version"];        
        
        if(pro_version < 10)
        {
            firstime = YES;
            [updater firsttime:defaults];
            [mdb updatedb];
        }
    }
    
    dbname = [documents stringByAppendingPathComponent:[properties valueForKey:@"dbname"]];
    
    return firstime;
}

+(void)firsttime:(NSDictionary*)plist
{
    NSNumber *appid = plist[@"appid"];
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    
    [userdef removePersistentDomainForName:NSGlobalDomain];
    [userdef removePersistentDomainForName:NSArgumentDomain];
    [userdef removePersistentDomainForName:NSRegistrationDomain];
    [userdef setValue:appid forKey:@"appid"];
    [userdef synchronize];
}

@end
