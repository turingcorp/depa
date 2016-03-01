#import "appdel.h"

@class mitemdetailinfostats;

@interface vitemstats:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(mitemdetailinfostats*)model;

@property(weak, nonatomic)mitemdetailinfostats *model;
@property(weak, nonatomic)UICollectionView *collection;

@end