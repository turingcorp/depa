#import "aparser.h"

@class mconfigloclistitem;

@interface aparserlocation:aparser

-(instancetype)init:(mconfigloclistitem*)item;

@property(weak, nonatomic)mconfigloclistitem *item;
@property(strong, nonatomic)NSMutableArray *array;
@property(copy, nonatomic)NSString *filterid;
@property(nonatomic)Class strategy;

@end