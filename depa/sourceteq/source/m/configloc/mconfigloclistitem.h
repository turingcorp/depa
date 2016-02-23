#import "appdel.h"
#import "sconfiglocprotocol.h"

@class mcountryitem;

@interface mconfigloclistitem:NSObject

-(NSUInteger)count;
-(mconfigloclistitem*)item:(NSUInteger)index;
-(void)fetch;
-(void)returnfetch:(NSArray*)returnarray;
-(void)sort;

@property(strong, nonatomic)id<sconfiglocprotocol> strategy;
@property(strong, nonatomic)mcountryitem *country;
@property(strong, nonatomic)mconfigloclistitem *parent;
@property(copy, nonatomic)NSString *title;

@end