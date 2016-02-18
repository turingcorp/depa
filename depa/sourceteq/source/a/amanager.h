#import "appdel.h"

@interface amanager:NSObject<NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

+(void)call:(id)delegate valriables:(NSString*)variables;
-(void)cancel;

@property(weak, nonatomic)id delegate;
@property(strong, nonatomic)id response;
@property(copy, nonatomic)NSString *variables;

@end