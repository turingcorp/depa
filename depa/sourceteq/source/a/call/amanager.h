#import "appdel.h"
#import "acalldelegate.h"

@class acall;
@class aparser;

@interface amanager:NSObject<NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

+(instancetype)call:(acall*)callmodel delegate:(id<acalldelegate>)delegate;
-(void)cancelcall;

@property(weak, nonatomic)id<acalldelegate> delegate;
@property(strong, nonatomic)acall *call;
@property(strong, nonatomic)NSDictionary *response;
@property(strong, nonatomic)NSURLSession *session;
@property(strong, nonatomic)NSMutableData *data;
@property(strong, nonatomic)NSError *error;

@end