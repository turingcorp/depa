#import "appdel.h"

@class vspinner;
@class mconfigloclistitem;

@interface vconfigloclist:UICollectionViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(void)load:(mconfigloclistitem*)item;

@property(strong, nonatomic)mconfigloclistitem *model;
@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)UIButton *buttonretry;

@end