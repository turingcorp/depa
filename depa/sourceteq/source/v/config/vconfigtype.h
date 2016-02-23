#import "appdel.h"

@interface vconfigtype:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mconfigtyp *model;
@property(weak, nonatomic)UICollectionView *collection;

@end