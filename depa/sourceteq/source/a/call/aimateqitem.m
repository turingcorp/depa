#import "aimateqitem.h"

@implementation aimateqitem

-(instancetype)init:(NSString*)url
{
    self = [super init];
    
    self.url = url;
    
    return self;
}

#pragma mark public

-(BOOL)equalsnotification:(NSNotification*)notification
{
    return notification.userInfo[@"image"] == self;
}

-(NSDictionary*)userinfo
{
    NSDictionary *userinfo = @{@"image":self};
    
    return userinfo;
}

@end