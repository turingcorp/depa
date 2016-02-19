#import "aimateq.h"

@implementation aimateq

+(instancetype)singleton
{
    static aimateq *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    NSString *queuename = @"imagedispatch";
    self.queue = dispatch_queue_create(queuename.UTF8String, DISPATCH_QUEUE_SERIAL);
    dispatch_set_target_queue(self.queue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0));
    dispatch_async(self.queue,
                   ^
                   {
                       self.tasks = [NSMutableArray array];
                   });
    
    NSOperationQueue *operation = [[NSOperationQueue alloc] init];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    [configuration setAllowsCellularAccess:YES];
    [configuration setTimeoutIntervalForRequest:40];
    self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:operation];
    
    return self;
}

#pragma mark public

-(void)addtoqueue:(aimateqitem*)item
{
    dispatch_async(self.queue,
                   ^
                   {
                       NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:[NSURL URLWithString:_url]];
                       [tasks addObject:task];
                       task.taskDescription = _url;
                       [task resume];
                   });
}


-(void)image:(NSString*)_url
{
    dispatch_async(queue,
                   ^(void)
                   {
                       
                   });
}

#pragma mark -
#pragma mark session task del

-(void)URLSession:(NSURLSession*)_session task:(NSURLSessionTask*)_task didCompleteWithError:(NSError*)_error
{
    if(_error)
    {
        NSLog(@"Image with error: %@", _error.localizedDescription);
    }
}

#pragma mark download task del

-(void)URLSession:(NSURLSession*)_session downloadTask:(NSURLSessionDownloadTask*)_task didFinishDownloadingToURL:(NSURL*)_location
{
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:_location]];
    
    dispatch_async(queue,
                   ^(void)
                   {
                       NSUInteger index = [tasks indexOfObject:_task];
                       
                       if(index != NSNotFound)
                       {
                           [tasks removeObject:_task];
                           NSString *url = _task.taskDescription;
                           cloudimgreference *reference = [[cloudimgreference alloc] init:url image:image];
                           
                           [[NSNotificationCenter defaultCenter] postNotificationName:notimageloaded object:nil userInfo:[reference userinfo]];
                       }
                   });
}

@end