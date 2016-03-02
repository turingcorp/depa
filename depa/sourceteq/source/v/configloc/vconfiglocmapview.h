#import "appdel.h"

@class mconfiglocmapann;

@interface vconfiglocmapview:MKMapView<UIGestureRecognizerDelegate>

@property(weak, nonatomic)mconfiglocmapann *annotation;

@end