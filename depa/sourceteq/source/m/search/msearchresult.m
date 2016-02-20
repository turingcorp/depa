#import "msearchresult.h"

@implementation msearchresult

-(instancetype)init:(NSDictionary*)rawitem
{
    self = [super init];

    self.itemid = rawitem[@"id"];
    self.itemtitle = rawitem[@"title"];
    self.itemprice = rawitem[@"price"];
    
    NSString *thumbnail = rawitem[@"thumbnail"];
    thumbnail = [thumbnail stringByReplacingOccurrencesOfString:@"-I.jpg" withString:@"-O.jpg"];
    self.apiimage = [[aimateqitem alloc] init:thumbnail];
    
    return self;
}

@end