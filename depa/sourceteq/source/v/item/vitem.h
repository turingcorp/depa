#import "appdel.h"
#import "viewbase.h"

@class vspinner;

@interface vitem:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *lcbar;
@property(weak, nonatomic)NSLayoutConstraint *lccontact;

@end