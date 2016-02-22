#import "appdel.h"
#import "viewbase.h"

@class mconfigloc;

@interface vconfigloc:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(void)changemode:(id<mconfiglocprotocol>)item;

@property(weak, nonatomic)UICollectionView *collection;
@property(strong, nonatomic)mconfigloc *model;

@end