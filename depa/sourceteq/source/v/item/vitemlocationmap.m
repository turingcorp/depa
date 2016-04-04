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
    [self setShowsPointsOfInterest:YES];
    [self setShowsScale:YES];
    [self setShowsTraffic:NO];
    
    if([self respondsToSelector:@selector(setShowsCompass:)])
    {
        [self setShowsCompass:NO];
    }
    
    return self;
}

@end