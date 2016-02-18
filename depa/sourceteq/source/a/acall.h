#import <Foundation/Foundation.h>

@interface acall:NSObject

@property(copy, nonatomic)NSString *server;
@property(copy, nonatomic)NSString *endpoint;
@property(nonatomic)NSUInteger timeout;

@end