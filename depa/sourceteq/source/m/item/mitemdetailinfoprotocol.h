#import <UIKit/UIKit.h>

@class mitemdetail;

@protocol mitemdetailinfoprotocol <NSObject>

-(void)config:(mitemdetail*)item collection:(UICollectionView*)collection;
-(UIView*)overview;
-(CGFloat)height;

@end