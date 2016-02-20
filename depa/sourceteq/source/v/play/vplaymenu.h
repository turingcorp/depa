#import "appdel.h"

@class cplayitem;
@class mplaymenu;

@interface vplaymenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cplayitem*)controller;

@property(weak, nonatomic)cplayitem *controller;
@property(strong, nonatomic)mplaymenu *model;
@property(weak, nonatomic)UICollectionView *collection;

@end