#import "vitemlocation.h"

@implementation vitemlocation

-(instancetype)init:(citemlocation*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.controllerlocation = controller;
    self.mapspan = MKCoordinateSpanMake(0.005, 0.005);
    vblur *blur = [vblur light:YES];
    vitemlocationmenu *menu = [[vitemlocationmenu alloc] init:controller];
    self.menu = menu;
    vitemlocationmap *map = [[vitemlocationmap alloc] init];
    self.map = map;
    
    [self addSubview:blur];
    [self addSubview:menu];
    [self addSubview:map];
    
    NSDictionary *views = @{@"blur":blur, @"menu":menu, @"map":map};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[menu(65)]-0-[map]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
    [self.map setShowsUserLocation:NO];
}

#pragma mark functionality

-(void)locationscheck
{
    switch([CLLocationManager authorizationStatus])
    {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            
            [self.map setShowsUserLocation:YES];
            
            break;
            
        case kCLAuthorizationStatusNotDetermined:
            
            self.locationmanager = [[CLLocationManager alloc] init];
            [self.locationmanager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
            [self.locationmanager setDistanceFilter:30];
            [self.locationmanager setDelegate:self];
            
            if([self.locationmanager respondsToSelector:@selector(requestWhenInUseAuthorization)])
            {
                [self.locationmanager requestWhenInUseAuthorization];
            }
            else
            {
                [self.locationmanager startUpdatingLocation];
            }
            
            if(![UIVisualEffectView class])
            {
                [self.map setShowsUserLocation:YES];
            }
            
            break;
            
        case kCLAuthorizationStatusDenied:
            break;
        case kCLAuthorizationStatusRestricted:
            break;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                   ^
                   {
                       [self centeritem];
                   });
}

#pragma mark public

-(void)loadmap
{
    [self.map setDelegate:self];
    [self locationscheck];
}

-(void)centeruser
{
    MKCoordinateRegion region = MKCoordinateRegionMake(self.userlocation, self.mapspan);
    [self.map setRegion:region animated:YES];
}

-(void)centeritem
{
    if(!self.annotation)
    {
        mitemdetail *item = self.controllerlocation.item;
        mitemannotation *annotation = [[mitemannotation alloc] init:item.displaytitle latitude:item.latitude.doubleValue longitude:item.longitude.doubleValue];
        self.annotation = annotation;
        
        [self.map addAnnotation:annotation];
    }
    
    MKCoordinateRegion region = MKCoordinateRegionMake(self.annotation.coordinate, self.mapspan);
    [self.map setRegion:region animated:YES];
    [self.map selectAnnotation:self.annotation animated:YES];
}

#pragma mark -
#pragma mark location delegate

-(void)mapView:(MKMapView*)mapview didUpdateUserLocation:(MKUserLocation*)userlocation
{
    self.userlocation = userlocation.coordinate;
}

-(void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.map setShowsUserLocation:YES];
    }
}

@end