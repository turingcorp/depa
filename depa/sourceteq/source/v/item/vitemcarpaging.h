#import "appdel.h"

@class aimateqitem;

@interface vitemcarpaging:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(NSArray<aimateqitem*>*)images;

@property(weak, nonatomic)NSArray<aimateqitem*> *images;
@property(weak, nonatomic)UICollectionView *collection;

@end