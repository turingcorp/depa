#import "acalllocationcity.h"

@implementation acalllocationcity

-(instancetype)init:(mconfigloclistitem*)item
{
    self = [super init:item];
    self.parser = [[aparserlocationcity alloc] init:item];
    
    return self;
}

@end