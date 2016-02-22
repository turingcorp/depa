#import <UIKit/UIKit.h>

@class cconfig;
@class vconfigcel;

@protocol mconfigprotocol <NSObject>

-(BOOL)selectable;
-(NSUInteger)cellheight;
-(UIView*)overview;

@optional

-(void)selected:(cconfig*)controller;

@end