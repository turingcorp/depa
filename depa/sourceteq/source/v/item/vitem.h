#import "appdel.h"
#import "viewbase.h"

@class citem;
@class vspinner;
@class vitemcar;
@class mitemdetailinfo;

@interface vitem:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(void)itemloaded;
-(void)descriptionloaded;
-(void)errorloading;

@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)vitemcar *car;
@property(strong, nonatomic)mitemdetailinfo *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *lcbar;
@property(weak, nonatomic)NSLayoutConstraint *lccontact;
@property(weak, nonatomic)NSLayoutConstraint *lccar;
@property(weak, nonatomic)NSLayoutConstraint *lccartop;

@end