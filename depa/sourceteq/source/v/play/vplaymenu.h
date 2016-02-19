#import "appdel.h"

@interface vplaymenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end