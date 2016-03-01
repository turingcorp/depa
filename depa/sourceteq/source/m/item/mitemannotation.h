#import "appdel.h"

@interface mitemannotation:NSObject<MKAnnotation>

-(instancetype)init:(NSString*)newtitle latitude:(double)latitude longitude:(double)longitude;

@end