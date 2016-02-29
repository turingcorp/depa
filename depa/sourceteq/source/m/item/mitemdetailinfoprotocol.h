#import <UIKit/UIKit.h>

@protocol mitemdetailinfoprotocol <NSObject>

-(void)config:(mitemdetail*)item;
-(UIView*)overview;
-(CGFloat)height;

@end