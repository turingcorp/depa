#import "appdel.h"
#import "aparser.h"

@interface aparsersearch:aparser

@property(strong, nonatomic)NSMutableArray *array;
@property(nonatomic)NSUInteger total;
@property(nonatomic)NSUInteger offset;
@property(nonatomic)NSUInteger limit;

@end