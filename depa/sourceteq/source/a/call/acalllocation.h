#import "acall.h"

@class mcountryitem;

@interface acalllocation:acall

-(instancetype)init:(mcountryitem*)country;
-(instancetype)init:(mcountryitem*)country variables:(NSString*)variables;

@property(weak, nonatomic)mcountryitem *country;

@end