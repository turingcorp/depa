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
    
    if(object && ![object isKindOfClass:[NSNull class]])
    {
        if([object isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *dictobject = object;
            NSArray *rawkeys = dictobject.allKeys;
            NSMutableDictionary *validdictionary = [NSMutableDictionary dictionary];
            
            for(NSString *key in rawkeys)
            {
                id rawobject = dictobject[key];
                id returnedobject = [self basicparse:rawobject];
                
                if(returnedobject)
                {
                    validdictionary[key] = returnedobject;
                }
            }
            
            validobject = validdictionary;
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