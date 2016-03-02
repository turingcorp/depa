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

#pragma mark gesture

-(void)taprecognized:(UITapGestureRecognizer*)_gesture
{
    [self removeAnnotation:self.annotation];
    annotation = [[modannotation alloc] init:[self pointtocoord:[_gesture locationInView:mapview]]];
    [mapview addAnnotation:annotation];
    [menu showsearch];
}

@end