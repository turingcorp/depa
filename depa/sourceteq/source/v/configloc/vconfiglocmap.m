#import "vconfiglocmap.h"

@implementation vconfiglocmap

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    self.firsttime = YES;
    self.mapspan = MKCoordinateSpanMake(0.05, 0.05);
    
    vconfiglocmapview *map = [[vconfiglocmapview alloc] init];
    [map setDelegate:self];
    self.map = map;
    
    vconfiglocmapmenu *menu = [[vconfiglocmapmenu alloc] init:self];
    self.menu = menu;
    
    [self addSubview:map];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"map":map, @"menu":menu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[menu(70)]" options:0 metrics:metrics views:views]];
    
    [self locationscheck];
    
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
            [self.menu showbuttonuser];
            
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
                [self.menu showbuttonuser];
                [self.map setShowsUserLocation:YES];
            }
            
            break;
            
        case kCLAuthorizationStatusDenied:
            break;
        case kCLAuthorizationStatusRestricted:
            break;
    }
}

#pragma mark public

-(void)centeruser
{
    MKCoordinateRegion region = MKCoordinateRegionMake(self.userlocation, self.mapspan);
    [self.map setRegion:region animated:YES];
}

#pragma mark -
#pragma mark location delegate

-(void)mapView:(MKMapView*)mapview didUpdateUserLocation:(MKUserLocation*)userlocation
{
    self.userlocation = userlocation.coordinate;
    
    if(self.firsttime)
    {
        self.firsttime = NO;
        [self centeruser];
    }
}

-(void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.menu showbuttonuser];
        [self.map setShowsUserLocation:YES];
    }
}

@end