#import "appdel.h"

@class vconfiglocmapview;
@class vconfiglocmapmenu;

@interface vconfiglocmap:UICollectionViewCell<MKMapViewDelegate, CLLocationManagerDelegate>

-(void)centeruser;

@property(weak, nonatomic)vconfiglocmapview *map;
@property(weak, nonatomic)vconfiglocmapmenu *menu;
@property(strong, nonatomic)CLLocationManager *locationmanager;
@property(nonatomic)MKCoordinateSpan mapspan;
@property(nonatomic)CLLocationCoordinate2D userlocation;
@property(nonatomic)BOOL firsttime;

@end