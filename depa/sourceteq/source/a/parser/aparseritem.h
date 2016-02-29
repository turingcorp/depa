#import "appdel.h"
#import "aparser.h"

@interface aparseritem:aparser

@property(strong, nonatomic)NSMutableArray *picturesarray;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSString *itemcurrency;
@property(copy, nonatomic)NSNumber *itemprice;

@end