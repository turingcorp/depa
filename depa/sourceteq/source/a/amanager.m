#import "amanager.h"

@implementation amanager

+(void)call:(apicall)call delegate:(id<acalldelegate>)delegate valriables:(NSString*)variables
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       
                   });
}

-(instancetype)init:(acall*)call delegate:(id<acalldelegate>)delegate
{
    self = [super init];
    
    self.call = call;
    self.delegate = delegate;
    
    return self;
}

@end