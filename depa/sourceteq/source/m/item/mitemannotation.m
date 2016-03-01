#import "mitemannotation.h"

@implementation mitemannotation

@synthesize title;
@synthesize coordinate;

-(instancetype)init:(NSString*)newtitle latitude:(double)latitude longitude:(double)longitude
{
    self = [super init];
    
    title = newtitle;
    coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    return self;
}

@end