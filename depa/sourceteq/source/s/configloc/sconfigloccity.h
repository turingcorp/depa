#import "appdel.h"
#import "sconfiglocprotocol.h"
#import "acalldelegate.h"


@interface sconfigloccity : NSObject

@end


#import "appdel.h"
#import "sconfiglocprotocol.h"
#import "acalldelegate.h"

@class amanager;
@class mconfigloclistitem;

@interface sconfiglocstate:NSObject<sconfiglocprotocol, acalldelegate>

@property(weak, nonatomic)amanager *manager;
@property(weak, nonatomic)mconfigloclistitem *item;

@end