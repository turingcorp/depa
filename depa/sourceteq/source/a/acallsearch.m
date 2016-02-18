#import "acallsearch.h"

@implementation acallsearch

-(instancetype)init:(id)variables
{
    self = [super init:variables];
    
    self.keyforendpoint = @"search";
    
    return self;
}

//https://api.mercadolibre.com/sites/MLM/search?has_pictures=yes&limit=1&offset=0&category=1479

@end