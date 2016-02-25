#import "aparser.h"

@class mconfigloclistitem;

@interface aparserlocation:aparser

-(instancetype)init:(mconfigloclistitem*)item;
-(void)lookingin:(NSArray*)filters;

@property(weak, nonatomic)mconfigloclistitem *item;
@property(strong, nonatomic)NSMutableArray *array;
@property(nonatomic)Class strategy;

@end