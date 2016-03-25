#import "appdel.h"

@class aimateqitem;

@interface mitemdetailimg:NSObject

-(void)add:(NSArray*)urls;

@property(strong, nonatomic)NSMutableArray<aimateqitem*> *items;

@end