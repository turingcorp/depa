#import "appdel.h"
#import "vconfigcelprotocol.h"

@class mconfigmod;

@interface vconfigmode:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, vconfigcelprotocol>

@property(strong, nonatomic)mconfigmod *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(nonatomic)NSUInteger selected;

@end