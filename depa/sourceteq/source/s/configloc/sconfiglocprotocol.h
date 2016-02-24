#import <UIKit/UIKit.h>

@class mconfigloclistitem;
@class aparserlocation;

@protocol sconfiglocprotocol <NSObject>

-(void)items:(mconfigloclistitem*)item;
-(NSString*)title;

@optional

-(NSString*)filterid;
-(void)nofilters:(NSDictionary*)json parser:(aparserlocation*)parser;

@end