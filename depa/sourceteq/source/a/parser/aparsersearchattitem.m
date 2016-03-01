#import "aparsersearchattitem.h"

@implementation aparsersearchattitem

-(instancetype)init:(search_attr)attr value:(NSString*)value
{
    self = [super init];
    
    self.attr = attr;
    NSString *rawvalue = value.lowercaseString;
    
    if([rawvalue isEqualToString:@"no"])
    {
        self.value = @"0";
    }
    else if([rawvalue isEqualToString:@"si"])
    {
        self.value = @"1";
    }
    else if([rawvalue isEqualToString:@"sí"])
    {
        self.value = @"1";
    }
    else if([rawvalue isEqualToString:@"yes"])
    {
        self.value = @"1";
    }
    else if([rawvalue isEqualToString:@"y"])
    {
        self.value = @"1";
    }
    else if([rawvalue isEqualToString:@"s"])
    {
        self.value = @"1";
    }
    else if([rawvalue rangeOfString:@"sin"].location != NSNotFound)
    {
        self.value = @"0";
    }
    else
    {
        self.value = value;
    }
    
    return self;
}

@end