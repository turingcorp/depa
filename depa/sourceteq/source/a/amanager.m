#import "amanager.h"

@implementation amanager

+(void)call:(apicall)call delegate:(id<acalldelegate>)delegate valriables:(NSString*)variables
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       acall *callmodel;
                       
                       switch(call)
                       {
                            case apicall_search:
                               
                               callmodel = [[acallsearch alloc] init];
                               
                               break;
                       }
                       
                       __unused amanager *manager = [[amanager alloc] init:callmodel delegate:delegate];
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