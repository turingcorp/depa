#import "appdel.h"

@class vconfigloc;

@interface vconfiglocmenu:UICollectionReusableView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(void)location:(vconfigloc*)configloc;

@property(weak, nonatomic)vconfigloc *configloc;

@end