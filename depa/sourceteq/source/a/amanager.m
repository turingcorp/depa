#import "amanager.h"

@implementation amanager

+(void)call:(apicall)call delegate:(id<acalldelegate>)delegate valriables:(id)variables
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       acall *callmodel;
                       
                       switch(call)
                       {
                            case apicall_search:
                               
                               callmodel = [[acallsearch alloc] init:variables];
                               
                               break;
                       }
                       
                       [callmodel buildrequest];
                       __unused amanager *manager = [[amanager alloc] init:callmodel delegate:delegate];
                   });
}

-(instancetype)init:(acall*)call delegate:(id<acalldelegate>)delegate
{
    self = [super init];
    
    self.call = call;
    self.delegate = delegate;
    
    NSOperationQueue *operation = [[NSOperationQueue alloc] init];
    NSURLSessionTask *task;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    [configuration setAllowsCellularAccess:YES];
    [configuration setTimeoutIntervalForRequest:call.timeout];
    self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:operation];
    task = [self.session dataTaskWithRequest:call.request];
    [task resume];
    [self.session finishTasksAndInvalidate];
    
    return self;
}

#pragma mark functionality

-(void)callerror:(NSString*)errorstring
{
    [self.delegate call:self error:errorstring];
    
#warning "track analytics"
}

#pragma mark -
#pragma mark session del

-(void)URLSession:(NSURLSession*)session didBecomeInvalidWithError:(NSError*)error
{
    self.error = self.error ? self.error : error;
    
    if(self.error)
    {
        [self callerror:self.error.localizedDescription];
    }
    else if(!self.data)
    {
        [self callerror:NSLocalizedString(@"apicall_error_nodata", nil)];
    }
    else
    {
        NSError *jsonerror;
        self.response = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingAllowFragments error:&jsonerror];
        
        if(jsonerror)
        {
            [self callerror:jsonerror.localizedDescription];
        }
        else if(!self.response)
        {
            [self callerror:NSLocalizedString(@"apicall_error_parsingjgon", nil)];
        }
        else
        {
            [self.delegate callsuccess:self];
        }
    }
}

#pragma mark session task del

-(void)URLSession:(NSURLSession*)session task:(NSURLSessionTask*)task didCompleteWithError:(NSError*)error
{
    self.error = error;
}

#pragma mark session data task del

-(void)URLSession:(NSURLSession*)session dataTask:(NSURLSessionDataTask*)task didReceiveData:(NSData*)data
{
    if(!self.data)
    {
        self.data = [NSMutableData data];
    }
    
    [self.data appendData:data];
}


@end