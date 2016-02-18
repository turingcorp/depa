#import <Foundation/Foundation.h>

@interface acall:NSObject

@property(copy, nonatomic)NSString *server;
@property(copy, nonatomic)NSString *endpoint;
@property(copy, nonatomic)NSString *variables;
@property(nonatomic)NSUInteger timeout;

@end