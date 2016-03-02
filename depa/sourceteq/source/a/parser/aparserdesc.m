#import "aparserdesc.h"

@implementation aparserdesc

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSString *rawtext = self.validjson[@"plain_text"];
        NSString *rawhtmltext = self.validjson[@"text"];
        
        if(rawtext && rawtext.length > 1)
        {
            self.itemdesc = [tools cleanlatin:rawtext];
        }
        else if(rawhtmltext && rawhtmltext.length > 1)
        {
            self.itemdesc = rawhtmltext;
        }
        else
        {
            self.itemdesc = @"";
        }
    }
}

@end