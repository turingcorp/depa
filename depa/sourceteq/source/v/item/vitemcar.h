#import "appdel.h"

@class citem;
@class vitemcarpaging;

@interface vitemcar:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(citem*)controller;
-(void)refresh;

@property(weak, nonatomic)citem *controller;
@property(weak, nonatomic)vitemcarpaging *paging;
@property(weak, nonatomic)UIImageView *currentImage;
@property(weak, nonatomic)UIImageView 

@end