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
            rawtext = [tools cleanlatin:rawtext];
            rawtext = [tools cleanwhite:rawtext];
            rawtext = [tools capitalfirst:rawtext];
            self.itemdesc = rawtext;
        }
        else if(rawhtmltext && rawhtmltext.length > 1)
        {
            rawhtmltext = [tools removehtml:rawhtmltext];
            rawhtmltext = [tools cleanlatin:rawhtmltext];
            rawhtmltext = [tools cleanwhite:rawhtmltext];
            rawhtmltext = [tools capitalfirst:rawhtmltext];
            self.itemdesc = rawhtmltext;
        }
        else
        {
            self.itemdesc = @"";
        }
    }
}

@end