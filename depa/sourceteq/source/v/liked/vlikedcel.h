#import "appdel.h"

@class mlikeditem;

@interface vlikedcel:UICollectionViewCell

-(void)config:(mlikeditem*)item;

@property(weak, nonatomic)mlikeditem *item;
@property(weak, nonatomic)UILabel *labeltitle;
@property(weak, nonatomic)UILabel *labelprice;

@end