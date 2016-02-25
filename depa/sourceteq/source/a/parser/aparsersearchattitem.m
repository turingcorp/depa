#import "aparsersearchattitem.h"

@implementation aparsersearchattitem

-(instancetype)init:(search_attr)attr value:(NSString*)value
{
    self = [super init];
    
    self.attr = attr;
    self.value = value;
    
    return self;
}

@end