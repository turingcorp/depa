#import "appdel.h"
#import "mitemdetailinfoprotocol.h"

@interface mitemdetailinfoaddress:NSObject<mitemdetailinfoprotocol>

@property(weak, nonatomic)mitemdetail *item;
@property(strong, nonatomic)NSMutableAttributedString *mutstring;
@property(nonatomic)CGFloat cellheight;
@property(nonatomic)CGFloat marginvertical;
@property(nonatomic)CGFloat marginhorizontal;
@property(nonatomic)CGFloat iconheight;

@end