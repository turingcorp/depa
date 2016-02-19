#import "aimateq.h"

@implementation aimateq

+(instancetype)singleton
{
    static aimateq *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

#pragma mark public

-(void)addtoqueue:(aimateqitem*)item
{
    
}

@end