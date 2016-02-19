#import "appdel.h"

@interface aimateqitem:NSObject

-(instancetype)init:(NSString*)url;
-(BOOL)equalsnotification:(NSNotification*)notification;
-(NSDictionary*)userinfo;

@property(weak, nonatomic)NSURLSessionDownloadTask *task;
@property(strong, nonatomic)UIImage *image;
@property(copy, nonatomic)NSString *url;

@end