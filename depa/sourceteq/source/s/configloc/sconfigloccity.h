#import "appdel.h"
#import "sconfiglocprotocol.h"
#import "acalldelegate.h"

@class amanager;
@class mconfigloclistitem;

@interface sconfigloccity:NSObject<sconfiglocprotocol, acalldelegate>

@property(weak, nonatomic)amanager *manager;
@property(weak, nonatomic)mconfigloclistitem *item;

@end