#import "appdel.h"
#import "sconfiglocprotocol.h"
#import "acalldelegate.h"

@class amanager;

@interface sconfiglocstate:NSObject<sconfiglocprotocol, acalldelegate>

@property(weak, nonatomic)amanager *manager;

@end