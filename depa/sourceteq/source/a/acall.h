#import <Foundation/Foundation.h>

@interface acall:NSObject

-(instancetype)init:(NSString*)variables;
-(NSURLRequest*)request;

@property(copy, nonatomic)NSString *server;
@property(copy, nonatomic)NSString *endpoint;
@property(copy, nonatomic)NSString *variables;
@property(copy, nonatomic)NSString *keyforserver;
@property(copy, nonatomic)NSString *keyforendpoint;
@property(nonatomic)NSUInteger timeout;
@property(nonatomic)BOOL post;

@end