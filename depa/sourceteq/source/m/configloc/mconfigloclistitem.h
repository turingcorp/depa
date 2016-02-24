#import "appdel.h"
#import "sconfiglocprotocol.h"

@class mcountryitem;

@interface mconfigloclistitem:NSObject

-(instancetype)init:(mcountryitem*)country;
-(NSUInteger)count;
-(mconfigloclistitem*)item:(NSUInteger)index;
-(void)fetch;
-(void)returnfetch:(NSArray*)returnarray;
-(void)returnerror:(NSString*)error;
-(void)sort;

@property(strong, nonatomic)id<sconfiglocprotocol> strategyinstance;
@property(strong, nonatomic)mconfigloclistitem *parent;
@property(weak, nonatomic)mcountryitem *country;
@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *title;
@property(copy, nonatomic)NSString *error;
@property(nonatomic)Class strategy;

@end