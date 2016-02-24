#import "acall.h"

@class mconfigloclistitem;

@interface acalllocation:acall

-(instancetype)init:(mconfigloclistitem*)item;

@property(weak, nonatomic)mconfigloclistitem *item;

@end