#import "appdel.h"
#import "mitemdetailinfoprotocol.h"

@interface mitemdetailinfoaddress:NSObject<mitemdetailinfoprotocol>

@property(weak, nonatomic)mitemdetail *item;
@property(strong, nonatomic)NSMutableAttributedString *mutstring;

@end