#import "appdel.h"
#import "mitemdetailinfoprotocol.h"

@interface mitemdetailinfo:NSObject

-(NSUInteger)count;
-(id<mitemdetailinfoprotocol>)item:(NSUInteger)index;
-(void)add:(id<mitemdetailinfoprotocol>)item;

@end