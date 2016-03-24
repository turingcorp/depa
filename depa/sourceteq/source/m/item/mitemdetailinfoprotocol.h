#import <UIKit/UIKit.h>

@class vitem;
@class mitemdetail;

@protocol mitemdetailinfoprotocol <NSObject>

-(void)config:(mitemdetail*)item view:(vitem*)view;
-(UIView*)overview;
-(CGFloat)height;

@end