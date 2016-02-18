#import "msearchresult.h"

@implementation msearchresult

-(instancetype)init:(NSDictionary*)rawitem
{
    self = [super init];

    self.itemid = rawitem[@"id"];
    self.itemtitle = rawitem[@"title"];
    self.itemthumbnail = rawitem[@"thumbnail"];
    self.itemprice = rawitem[@"price"];
    self.itemthumbnail = [self.itemthumbnail stringByReplacingOccurrencesOfString:@"-I.jpg" withString:@"-O.jpg"];
    
    return self;
}

@end