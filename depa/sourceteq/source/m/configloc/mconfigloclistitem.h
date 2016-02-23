#import "appdel.h"
#import "sconfiglocprotocol.h"

@class mcountry;

@interface mconfigloclistitem:NSObject

-(NSUInteger)count;
-(mconfigloclistitem*)item:(NSUInteger)index;

@property(strong, nonatomic)id<sconfiglocprotocol> strategy;
@property(strong, nonatomic)mcountry *countries;
@property(strong, nonatomic)mconfigloclistitem *parent;
@property(copy, nonatomic)NSString *titletype;
@property(copy, nonatomic)NSString *titleitem;

@end