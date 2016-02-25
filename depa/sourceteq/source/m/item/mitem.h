#import "appdel.h"

@class mitemitem;

@interface mitem:NSObject

-(instancetype)init:(NSString*)countryid;
-(NSUInteger)count;
-(mitemitem*)item:(NSUInteger)index;

@property(copy, nonatomic)NSString *countryid;

@end