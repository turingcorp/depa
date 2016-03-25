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

-(void)addann:(CLLocationCoordinate2D)coords
{
    [self removeAnnotation:self.annotation];
    mconfiglocmapann *annotation = [[mconfiglocmapann alloc] init:coords];
    self.annotation = annotation;
    [self addAnnotation:annotation];
}

-(void)focusoncenter
{
    CGFloat width_2 = self.bounds.size.width / 2.0;
    CGFloat height_2 = self.bounds.size.height / 2.0;
    CGPoint center = CGPointMake(width_2, height_2);
    
    [self addann:[self pointtocoord:center]];
}

#pragma mark gesture

-(void)taprecognized:(UITapGestureRecognizer*)gesture
{
    [self addann:[self pointtocoord:[gesture locationInView:self]]];
}

@end