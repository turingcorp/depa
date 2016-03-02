#import "vconfiglocmapview.h"

@implementation vconfiglocmapview

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
    [self setShowsCompass:NO];
    [self setShowsPointsOfInterest:NO];
    [self setShowsScale:NO];
    [self setShowsTraffic:NO];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taprecognized:)];
    [self addGestureRecognizer:tap];
    
    return self;
}

#pragma mark public

-(CLLocationCoordinate2D)pointtocoord:(CGPoint)point
{
    CLLocationCoordinate2D location;
    location = [self convertPoint:point toCoordinateFromView:self];
    
    return location;
}

-(void)addannotation:(CLLocationCoordinate2D)coords
{
    [self removeAnnotation:self.annotation];
    mconfiglocmapann *annotation = [[mconfiglocmapann alloc] init:coords];
    self.annotation = annotation;
    [self addAnnotation:annotation];
}

#pragma mark gesture

-(void)taprecognized:(UITapGestureRecognizer*)gesture
{
    [self addannotation:[self pointtocoord:[gesture locationInView:self]]];
}

@end