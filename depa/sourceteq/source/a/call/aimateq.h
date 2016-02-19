#import "appdel.h"

@class aimateqitem;

@interface aimateq:NSObject<NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate>

+(instancetype)singleton;
-(void)addtoqueue:(aimateqitem*)item;

@property(strong, nonatomic)NSMutableArray *tasks;
@property(strong, nonatomic)NSURLSession *session;
@property(nonatomic)dispatch_queue_t queue;

@end