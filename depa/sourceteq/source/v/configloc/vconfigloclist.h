#import "appdel.h"

@class vspinner;
@class mconfigloclistitem;

@interface vconfigloclist:UICollectionViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mconfigloclistitem *model;
@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UICollectionView *collection;

@end