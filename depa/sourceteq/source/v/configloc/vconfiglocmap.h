#import "appdel.h"

@class vconfiglocmapview;

@interface vconfiglocmap:UICollectionViewCell<MKMapViewDelegate, CLLocationManagerDelegate>

@property(weak, nonatomic)vconfiglocmapview *map;
@property(strong, nonatomic)CLLocationManager *locationmanager;
@property(nonatomic)MKCoordinateSpan mapspan;
@property(nonatomic)CLLocationCoordinate2D userlocation;

@end