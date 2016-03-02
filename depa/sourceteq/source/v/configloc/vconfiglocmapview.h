#import "appdel.h"

@class vconfiglocmapann;

@interface vconfiglocmapview:MKMapView<UIGestureRecognizerDelegate>

@property(weak, nonatomic)vconfiglocmapann *annotation;

@end