#import "appdel.h"
#import "viewbase.h"

@class vitemlocationmenu;

@interface vitemlocation:viewbase<MKMapViewDelegate, CLLocationManagerDelegate>

@property(weak, nonatomic)vitemlocationmenu *menu;
@property(weak, nonatomic)vimapkit *mapkit;
@property(nonatomic)CLLocationCoordinate2D userlocation;

@end