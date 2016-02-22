#import "msearchresult.h"

@implementation msearchresult

-(instancetype)init:(NSDictionary*)rawitem
{
    self = [super init];

    self.itemid = rawitem[@"id"];
    self.itemprice = rawitem[@"price"];
    
    NSString *itemrawtitle = rawitem[@"title"];
    
    if(itemrawtitle.length > 1)
    {
        NSString *titleprefix = [itemrawtitle substringToIndex:1].uppercaseString;
        NSString *titlesuffix = [itemrawtitle substringFromIndex:1].lowercaseString;
        itemrawtitle = [NSString stringWithFormat:@"%@%@", titleprefix, titlesuffix];
    }
    
    self.itemtitle = itemrawtitle;
    
    NSString *thumbnail = rawitem[@"thumbnail"];
    thumbnail = [thumbnail stringByReplacingOccurrencesOfString:@"-I.jpg" withString:@"-O.jpg"];
    self.apiimage = [[aimateqitem alloc] init:thumbnail];
    
    return self;
}

@end