#import "appdel.h"

@class vconfigloc;

@interface vconfiglocmenu:UICollectionReusableView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)vconfigloc *configloc;

@end