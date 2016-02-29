#import "appdel.h"

@class citem;

@interface vitemcarpaging:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(citem*)controller;

@property(weak, nonatomic)citem *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end