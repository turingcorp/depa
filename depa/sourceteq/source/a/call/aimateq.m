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
    __weak typeof(self) weakself = self;
    dispatch_async(weakself.queue,
                   ^
                   {
                       weakself.items = [NSMutableArray array];
                   });
    
    NSOperationQueue *operation = [[NSOperationQueue alloc] init];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    [configuration setAllowsCellularAccess:YES];
    [configuration setTimeoutIntervalForRequest:40];
    self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:operation];
    
    return self;
}

#pragma mark functionality

-(void)imageerror:(NSString*)error
{
#if DEBUG
    
    NSLog(@"Image error: %@", error);
    
#endif
}

#pragma mark public

-(void)addtoqueue:(aimateqitem*)item
{
    __weak typeof(self) weakself = self;
    dispatch_async(weakself.queue,
                   ^
                   {
                       if(!item.task)
                       {
                           //NSLog(@"%@", item.url);
                           
                           NSURL *url = [NSURL URLWithString:item.url];
                           NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:url];
                           item.task = task;
                           [weakself.items addObject:item];
                           [task resume];
                       }
                   });
}

#pragma mark -
#pragma mark session task del

-(void)URLSession:(NSURLSession*)session task:(NSURLSessionTask*)task didCompleteWithError:(NSError*)error
{
    if(error)
    {
        [self imageerror:error.localizedDescription];
    }
}

#pragma mark download task del

-(void)URLSession:(NSURLSession*)session downloadTask:(NSURLSessionDownloadTask*)task didFinishDownloadingToURL:(NSURL*)location
{
    NSData *data = [NSData dataWithContentsOfURL:location];
    UIImage *image = [UIImage imageWithData:data];
    
    if(image)
    {
        __weak typeof(self) weakself = self;
        dispatch_async(weakself.queue,
                       ^
                       {
                           NSUInteger count = weakself.items.count;
                           
                           for(NSUInteger i = 0; i < count; i++)
                           {
                               aimateqitem *item = weakself.items[i];
                               
                               if(item.task == task)
                               {
                                   [weakself.items removeObjectAtIndex:i];
                                   item.image = image;
                                   [[NSNotificationCenter defaultCenter] postNotificationName:notimageloaded object:nil userInfo:[item userinfo]];
                                   
                                   break;
                               }
                           }
                       });
    }
    else
    {
        [self imageerror:NSLocalizedString(@"apicall_imateq_error_noimage", nil)];
    }
}

@end