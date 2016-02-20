#import <UIKit/UIKit.h>

@class cplayitem;

@protocol mplaymenuprotocol <NSObject>

-(NSString*)assetname;
-(UIColor*)tintcolor;
-(void)action:(cplayitem*)controller;

@end