#import "aimateqitem.h"

@implementation aimateqitem

-(instancetype)init:(NSString*)url
{
    self = [super init];
    
    self.url = url;
    
    return self;
}

@end