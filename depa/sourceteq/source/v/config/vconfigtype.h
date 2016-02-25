#import "appdel.h"
#import "vconfigcelprotocol.h"

@class mconfigtyp;

@interface vconfigtype:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, vconfigcelprotocol>

@property(strong, nonatomic)mconfigtyp *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(nonatomic)NSUInteger selected;

@end