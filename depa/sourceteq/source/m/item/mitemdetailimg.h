#import "appdel.h"

@class aimateqitem;

@interface mitemdetailimg:NSObject

-(NSUInteger)count;
-(aimateqitem*)item:(NSUInteger)index;
-(void)add:(NSArray*)urls;

@end