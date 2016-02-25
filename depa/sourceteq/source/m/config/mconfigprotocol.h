#import <UIKit/UIKit.h>
#import "vconfigcelprotocol.h"

@class cconfig;
@class vconfigcel;

@protocol mconfigprotocol <NSObject>

-(BOOL)selectable;
-(NSUInteger)cellheight;
-(UIView<vconfigcelprotocol>*)overview;

@optional

-(void)selected:(cconfig*)controller;

@end