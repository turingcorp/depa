#import "appdel.h"
#import "viewbase.h"

@class mconfig;

@interface vconfig:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(void)didappear;

@property(strong, nonatomic)mconfig *model;
@property(weak, nonatomic)UICollectionView *collection;

@end