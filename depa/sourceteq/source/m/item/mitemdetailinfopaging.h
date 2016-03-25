#import "appdel.h"
#import "mitemdetailinfoprotocol.h"

@interface mitemdetailinfopaging:NSObject<mitemdetailinfoprotocol>

@property(weak, nonatomic)mitemdetail *item;
@property(weak, nonatomic)vitem *view;

@end