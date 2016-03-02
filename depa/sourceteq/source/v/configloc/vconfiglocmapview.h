#import "appdel.h"

@class mconfiglocmapann;

@interface vconfiglocmapview:MKMapView<UIGestureRecognizerDelegate>

-(CLLocationCoordinate2D)pointtocoord:(CGPoint)point;
-(void)addannotation:(CLLocationCoordinate2D)coords;

@property(weak, nonatomic)mconfiglocmapann *annotation;

@end