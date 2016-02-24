#import "acalllocationneigh.h"

@implementation acalllocationneigh

-(instancetype)init:(mconfigloclistitem*)item
{
    self = [super init:item];
    self.parser = [[aparserlocationneigh alloc] init:item];
    
    return self;
}

@end