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
                       self.items = [NSMutableArray array];
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
    NSLog(@"Image error: %@", error);
    
#warning "add analytics"
}

#pragma mark public

-(void)addtoqueue:(aimateqitem*)item
{
    dispatch_async(self.queue,
                   ^
                   {
                       if(!item.task)
                       {
                           NSURL *url = [NSURL URLWithString:item.url];
                           NSURLSessionDownloadTask *task = [self.session downloadTaskWithURL:url];
                           item.task = task;
                           [self.items addObject:item];
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
        dispatch_async(self.queue,
                       ^
                       {
                           NSUInteger count = self.items.count;
                           
                           for(NSUInteger i = 0; i < count; i++)
                           {
                               aimateqitem *item = self.items[i];
                               
                               if(item.task == task)
                               {
                                   [self.items removeObjectAtIndex:i];
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