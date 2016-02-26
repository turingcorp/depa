#import "appdel.h"
#import "viewbase.h"

@class mliked;

@interface vliked:viewbase<UICollectionViewDataSource, UICollectionViewDelegate>

@property(strong, nonatomic)mliked *model;
@property(weak, nonatomic)UICollectionView *collection;

@end