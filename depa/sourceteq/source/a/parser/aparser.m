#import "aparser.h"

@implementation aparser

-(instancetype)init:(NSDictionary*)json
{
    self = [super init];
    
    NSDictionary *validjson = [self basicparse:json];
    
    return self;
}

#pragma mark functionality

-(id)basicparse:(id)object
{
    id validobject;
    
    if(object)
    {
        if([object isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *dictobject = object;
            NSArray *rawkeys = dictobject.allKeys;
            validobject = [NSMutableDictionary  dictionary];
        }
        else if([object isKindOfClass:[NSArray class]])
        {
            validobject = [NSMutableArray array];
        }
        else
        {
            validobject = object;
        }
    }
    
    return validobject;
}

@end