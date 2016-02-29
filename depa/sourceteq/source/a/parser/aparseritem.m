#import "aparseritem.h"

@implementation aparseritem

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    self.picturesarray = [NSMutableArray array];
    
    if(self.validjson)
    {
        NSArray *jsonpictures = self.validjson[@"pictures"];
        NSUInteger count = jsonpictures.count;
        
        for(NSUInteger i = 0; i < count; i++)
        {
            NSDictionary *rawpicture = jsonpictures[i];
            
        }
    }
}

@end