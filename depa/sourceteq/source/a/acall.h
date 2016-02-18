#import <Foundation/Foundation.h>

@interface acall:NSObject

-(instancetype)init:(id)variables;
-(void)buildrequest;
-(void)buildendpoint:(NSDictionary*)params;
-(NSURLRequest*)request;

@property(copy, nonatomic)id variables;
@property(copy, nonatomic)NSString *server;
@property(copy, nonatomic)NSString *endpoint;
@property(copy, nonatomic)NSString *keyforserver;
@property(copy, nonatomic)NSString *keyforendpoint;
@property(nonatomic)NSURLRequestCachePolicy cachepolicy;
@property(nonatomic)NSUInteger timeout;
@property(nonatomic)BOOL post;

@end