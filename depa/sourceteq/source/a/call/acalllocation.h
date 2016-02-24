#import "acall.h"

@class mcountryitem;

@interface acalllocation:acall

-(instancetype)init:(mconfigloclistitem*)item;
-(instancetype)init:(mconfigloclistitem*)item variables:(NSString*)variables;

@property(weak, nonatomic)mconfigloclistitem *item;

@end