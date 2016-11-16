#import "appdel.h"

@class cpages;

@interface cmain:UINavigationController

+(instancetype)singleton;
-(void)statusBarDefault;
-(void)statusBarLight;

@property(weak, nonatomic)cpages *pages;

@end
