#import "appdel.h"

@class mconfigmod;

@interface vconfigmode:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mconfigmod *model;
@property(weak, nonatomic)UICollectionView *collection;

@end