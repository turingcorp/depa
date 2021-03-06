#import "appdel.h"

@class citem;
@class vitemcarcel;
@class aimateqitem;
@class vitemcarpaging;

@interface vitemcar:UIView

-(instancetype)init:(citem*)controller;
-(void)refresh;
-(void)loadpaging:(vitemcarpaging*)paging;
-(void)selectitem:(NSUInteger)index;

@property(weak, nonatomic)citem *controller;
@property(weak, nonatomic)vitemcarcel *cellcurrent;
@property(weak, nonatomic)vitemcarcel *cellnext;
@property(weak, nonatomic)vitemcarpaging *paging;
@property(weak, nonatomic)aimateqitem *nextimage;
@property(weak, nonatomic)UICollectionView *maincollection;
@property(weak, nonatomic)UIPanGestureRecognizer *pangesture;
@property(weak, nonatomic)NSArray<aimateqitem*> *images;
@property(nonatomic)NSUInteger currentindex;

@end