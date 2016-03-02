#import "appdel.h"

@class vconfiglocmapannpoint;

@interface vconfiglocmapann:MKAnnotationView

@property(weak, nonatomic)vconfiglocmapannpoint *point;
@property(nonatomic)BOOL ispanning;

@end