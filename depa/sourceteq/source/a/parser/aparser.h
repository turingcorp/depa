#import <UIKit/UIKit.h>

@interface aparser:NSObject

-(instancetype)init:(NSDictionary*)json;

@property(strong, nonatomic)NSDictionary *validjson;

@end