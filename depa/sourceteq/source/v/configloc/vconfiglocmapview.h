#import "appdel.h"

@class mconfiglocmapann;

@interface vconfiglocmapview:MKMapView<UIGestureRecognizerDelegate>

-(void)addannotation:(CLLocationCoordinate2D)coords;

@property(weak, nonatomic)mconfiglocmapann *annotation;

@end