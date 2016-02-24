#import "aparser.h"

@implementation aparser

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
            NSArray *arrobject = object;
            NSMutableArray *validarray = [NSMutableArray array];
            NSUInteger count = arrobject.count;
            
            for(NSUInteger i = 0; i < count; i++)
            {
                id rawobject = arrobject[i];
                id returnedobject = [self basicparse:rawobject];
                
                if(returnedobject)
                {
                    [validarray addObject:returnedobject];
                }
            }
            
            validobject = validarray;
        }
        else
        {
            validobject = object;
        }
    }
    
    return validobject;
}

#pragma mark public

-(void)parse:(NSDictionary*)json
{
    self.validjson = [self basicparse:json];
}

@end