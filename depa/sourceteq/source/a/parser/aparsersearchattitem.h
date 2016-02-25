#import "appdel.h"

@interface aparsersearchattitem:NSObject

-(instancetype)init:(search_attr)attr value:(NSString*)value;

@property(copy, nonatomic)NSString *value;
@property(nonatomic)search_attr attr;

@end