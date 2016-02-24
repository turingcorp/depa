#import <UIKit/UIKit.h>

@interface aparser:NSObject

-(void)parse:(NSDictionary*)json;

@property(strong, nonatomic)NSDictionary *validjson;

@end