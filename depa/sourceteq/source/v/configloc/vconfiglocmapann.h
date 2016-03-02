#import "appdel.h"

@class vconfiglocmapannpoint;

@interface vconfiglocmapann:MKAnnotationView<UIGestureRecognizerDelegate>

@property(weak, nonatomic)vconfiglocmapannpoint *point;
@property(nonatomic)BOOL ispanning;

@end