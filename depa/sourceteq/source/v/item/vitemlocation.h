#import "appdel.h"
#import "viewbase.h"

@class citemlocation;
@class vitemlocationmenu;
@class vitemlocationmap;
@class mitemannotation;

@interface vitemlocation:viewbase<MKMapViewDelegate, CLLocationManagerDelegate>

-(void)loadmap;
-(void)centeruser;
-(void)centeritem;

@property(weak, nonatomic)citemlocation *controllerlocation;
@property(weak, nonatomic)vitemlocationmenu *menu;
@property(weak, nonatomic)vitemlocationmap *map;
@property(weak, nonatomic)mitemannotation *annotation;
@property(strong, nonatomic)CLLocationManager *locationmanager;
@property(nonatomic)MKCoordinateSpan mapspan;
@property(nonatomic)CLLocationCoordinate2D userlocation;

@end