#import "appdel.h"

@class mplaymenu;

@interface vplaymenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mplaymenu *model;
@property(weak, nonatomic)UICollectionView *collection;

@end