#import <UIKit/UIKit.h>

@class cconfig;
@class vconfigcel;

@protocol mconfigprotocol <NSObject>

-(BOOL)selectable;
-(void)config:(vconfigcel*)cel;

@optional

-(void)selected:(cconfig*)controller;

@end