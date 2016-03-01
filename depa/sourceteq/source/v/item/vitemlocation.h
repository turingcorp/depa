#import "appdel.h"
#import "viewbase.h"

@class vitemlocationmenu;
@class vitemlocationmap;

@interface vitemlocation:viewbase<MKMapViewDelegate, CLLocationManagerDelegate>

-(void)loadmap;

@property(weak, nonatomic)vitemlocationmenu *menu;
@property(weak, nonatomic)vitemlocationmap *map;
@property(strong, nonatomic)CLLocationManager *locationmanager;
@property(nonatomic)MKCoordinateSpan mapspan;
@property(nonatomic)CLLocationCoordinate2D userlocation;
@property(nonatomic)BOOL updateinitial;

@end