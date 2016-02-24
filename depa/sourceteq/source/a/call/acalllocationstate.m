#import "acalllocationstate.h"

@implementation acalllocationstate

-(instancetype)init:(mconfigloclistitem*)item
{
    self = [super init:item];
    self.parser = [[aparserlocationstate alloc] init:item];
    
    return self;
}

@end