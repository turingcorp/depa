#import "vitemlocationmap.h"

@implementation vitemlocationmap

-(instancetype)init
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setRotateEnabled:NO];
    [self setScrollEnabled:YES];
    [self setZoomEnabled:YES];
    [self setPitchEnabled:NO];
    [self setMapType:MKMapTypeStandard];
    [self setShowsBuildings:NO];
    [self setShowsCompass:YES];
    [self setShowsPointsOfInterest:NO];
    [self setShowsScale:YES];
    [self setShowsTraffic:NO];
    
    return self;
}

@end