#import "appdel.h"

@interface aimateqitem:NSObject

-(instancetype)init:(NSString*)url;

@property(strong, nonatomic)UIImage *image;
@property(copy, nonatomic)NSString *url;

@end