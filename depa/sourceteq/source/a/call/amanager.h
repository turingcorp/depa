#import "appdel.h"
#import "acalldelegate.h"

@class acall;

@interface amanager:NSObject<NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

+(void)call:(apicall)call delegate:(id<acalldelegate>)delegate valriables:(id)variables;

@property(weak, nonatomic)id<acalldelegate> delegate;
@property(strong, nonatomic)NSDictionary *response;
@property(strong, nonatomic)acall *call;
@property(strong, nonatomic)NSURLSession *session;
@property(strong, nonatomic)NSMutableData *data;
@property(strong, nonatomic)NSError *error;

@end