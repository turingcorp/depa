#import "appdel.h"
#import "mitemdetailinfoprotocol.h"

@class mitemdetail;

@interface mitemdetailinfo:NSObject

-(instancetype)init:(UICollectionView*)collection;
-(void)loaditem:(mitemdetail*)item;
-(void)adddescription;

@property(strong, nonatomic)NSMutableArray<id<mitemdetailinfoprotocol>> *items;
@property(weak, nonatomic)UICollectionView *collection;

@end