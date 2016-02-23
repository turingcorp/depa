#import "appdel.h"

@interface mconfigloclistitem:NSObject

-(NSUInteger)count;
-(mconfigloclistitem*)item:(NSUInteger)index;

@property(strong, nonatomic)mconfigloclistitem *parent;
@property(copy, nonatomic)NSString *titletype;
@property(copy, nonatomic)NSString *titleitem;

@end