#import "appdel.h"

@class mconfiglocmapann;

@interface vconfiglocmapview:MKMapView<UIGestureRecognizerDelegate>

-(CLLocationCoordinate2D)pointtocoord:(CGPoint)point;
-(void)addann:(CLLocationCoordinate2D)coords;
-(void)focusoncenter;

@property(weak, nonatomic)mconfiglocmapann *annotation;

@end