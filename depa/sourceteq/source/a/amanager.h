#import "appdel.h"

@interface amanager:NSObject<NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

+(void)call:(apicall)call delegate:(id)delegate valriables:(NSString*)variables;
-(void)cancel;

@property(weak, nonatomic)id delegate;
@property(strong, nonatomic)id response;
@property(copy, nonatomic)NSString *variables;
@property(nonatomic)

@end