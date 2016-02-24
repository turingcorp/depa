#import <UIKit/UIKit.h>

@class mconfigloclistitem;

@protocol sconfiglocprotocol <NSObject>

-(void)items:(mconfigloclistitem*)item;
-(NSString*)title;

@optional

-(NSString*)filterid;

@end