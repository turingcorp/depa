#import "appdel.h"
#import "vconfigcelprotocol.h"

@class mconfigsor;

@interface vconfigsort:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, vconfigcelprotocol>

@property(strong, nonatomic)mconfigsor *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(nonatomic)NSUInteger selected;

@end