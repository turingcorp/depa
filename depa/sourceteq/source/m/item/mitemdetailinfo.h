#import "appdel.h"
#import "mitemdetailinfoprotocol.h"

@class vitem;
@class mitemdetail;

@interface mitemdetailinfo:NSObject

-(instancetype)init:(vitem*)view;
-(void)loaditem:(mitemdetail*)item;
-(void)adddescription;

@property(strong, nonatomic)NSMutableArray<id<mitemdetailinfoprotocol>> *items;
@property(weak, nonatomic)vitem *view;
@property(weak, nonatomic)mitemdetail *item;

@end