#import "appdel.h"
#import "viewbase.h"

@interface vitem:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *lcbar;

@end