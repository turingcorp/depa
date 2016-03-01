#import "appdel.h"
#import "aparser.h"

@interface aparseritem:aparser

@property(strong, nonatomic)NSMutableArray *picturesarray;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSString *itemcurrency;
@property(copy, nonatomic)NSString *itemaddress;
@property(copy, nonatomic)NSNumber *itemprice;
@property(copy, nonatomic)NSNumber *latitude;
@property(copy, nonatomic)NSNumber *longitude;
@property(nonatomic)NSUInteger rooms;
@property(nonatomic)NSUInteger meters;
@property(nonatomic)NSUInteger garages;

@end