#import "appdel.h"
#import "viewbase.h"

@class mliked;
@class vlikedheader;

@interface vliked:viewbase<UICollectionViewDataSource, UICollectionViewDelegate>

-(void)unselect;

@property(strong, nonatomic)mliked *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)vlikedheader *header;

@end