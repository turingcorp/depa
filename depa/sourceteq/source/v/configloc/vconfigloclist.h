#import "appdel.h"

@class mconfigloclistitem;

@interface vconfigloclist:UICollectionViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mconfigloclistitem *model;
@property(weak, nonatomic)UICollectionView *collection;

@end