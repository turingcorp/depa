#import "mconfiglocmapann.h"

@implementation mconfiglocmapann

@synthesize coordinate;

-(instancetype)init:(CLLocationCoordinate2D)coords
{
    self = [super init];
    
    coordinate = coords;
    
    return self;
}

@end