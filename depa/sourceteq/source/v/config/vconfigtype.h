#import "appdel.h"

@class mconfigtyp;

@interface vconfigtype:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mconfigtyp *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(nonatomic)NSUInteger selected;

@end