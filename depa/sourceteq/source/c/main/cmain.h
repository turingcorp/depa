#import "appdel.h"

@class cpages;

@interface cmain:UINavigationController

+(instancetype)singleton;

@property(weak, nonatomic)cpages *pages;

@end