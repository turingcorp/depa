#import "appdel.h"

@class vitem;
@class aimateqitem;

@interface vitemcarpaging:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(NSArray<aimateqitem*>*)images view:(vitem*)view;

@property(weak, nonatomic)vitem *view;
@property(weak, nonatomic)NSArray<aimateqitem*> *images;
@property(weak, nonatomic)UICollectionView *collection;

@end