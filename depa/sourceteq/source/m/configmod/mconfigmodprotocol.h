#import <UIKit/UIKit.h>

@protocol mconfigmodprotocol <NSObject>

-(NSString*)title;
-(search_mode)type;
-(NSUInteger)pricemax;
-(NSUInteger)pricemaxmin;
-(NSUInteger)pricemin;
-(NSUInteger)priceminmax;

@end