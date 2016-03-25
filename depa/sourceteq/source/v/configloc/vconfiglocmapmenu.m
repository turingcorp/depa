#import "vconfiglocmapmenu.h"

@implementation vconfiglocmapmenu

-(instancetype)init:(vconfiglocmap*)map
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.map = map;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *btnaccept = [[UIButton alloc] init];
    [btnaccept setClipsToBounds:YES];
    [btnaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnaccept setBackgroundColor:colormain];
    [btnaccept setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnaccept setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [btnaccept.titleLabel setFont:[UIFont fontWithName:fontboldname size:14]];
    [btnaccept.layer setCornerRadius:4];
    [btnaccept setTitle:NSLocalizedString(@"config_location_acceptselection", nil) forState:UIControlStateNormal];
    [btnaccept addTarget:self action:@selector(actionaccept:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnuser = [[UIButton alloc] init];
    [btnuser setClipsToBounds:YES];
    [btnuser setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnuser setImage:[[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [btnuser setImage:[[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [btnuser.imageView setTintColor:colormain];
    [btnuser.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btnuser.imageView setClipsToBounds:YES];
    [btnuser setHidden:YES];
    [btnuser addTarget:self action:@selector(actionuser:) forControlEvents:UIControlEventTouchUpInside];
    self.btnuser = btnuser;

    [self addSubview:border];
    [self addSubview:btnaccept];
    [self addSubview:btnuser];
    
    NSDictionary *views = @{@"accept":btnaccept, @"user":btnuser, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[user(50)]-10-[accept(180)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[user]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[accept]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionaccept:(UIButton*)button
{
    [self.map setUserInteractionEnabled:NO];
    vconfiglocmapview *map = self.map.map;
    [map setHidden:YES];
    [self.map.menu setHidden:YES];
    
    vspinner *spinner = [[vspinner alloc] init];
    [spinner startAnimating];
    [self.map addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self.map addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self.map addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-120-[spinner(40)]" options:0 metrics:metrics views:views]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       vconfiglocmapann *ann = (vconfiglocmapann*)[map viewForAnnotation:map.annotation];
                       
                       CGPoint point1 = ann.point.frame.origin;
                       CGPoint point2 = CGPointMake(CGRectGetMaxX(ann.point.frame), CGRectGetMaxY(ann.point.frame));
                       CGPoint pointcenter = CGPointMake(CGRectGetMidX(ann.point.frame), CGRectGetMidY(ann.point.frame));
                       CGPoint point1x = [map convertPoint:point1 fromView:ann];
                       CGPoint point2x = [map convertPoint:point2 fromView:ann];
                       CGPoint pointcenterx = [map convertPoint:pointcenter fromView:ann];
                       CLLocationCoordinate2D locmin = [map pointtocoord:point1x];
                       CLLocationCoordinate2D locmax = [map pointtocoord:point2x];
                       CLLocationCoordinate2D loccenter = [map pointtocoord:pointcenterx];
                       CLLocation *itemlocation = [[CLLocation alloc] initWithLatitude:loccenter.latitude longitude:loccenter.longitude];
                       
                       double lata = locmin.latitude;
                       double latb = locmax.latitude;
                       double lona = locmin.longitude;
                       double lonb = locmax.longitude;
                       double minlat = lata;
                       double maxlat = latb;
                       double minlon = lona;
                       double maxlon = lonb;
                       
                       if(minlat > maxlat)
                       {
                           double aux = minlat;
                           minlat = maxlat;
                           maxlat = aux;
                       }
                       
                       if(minlon > maxlon)
                       {
                           double aux = minlon;
                           minlon = maxlon;
                           maxlon = aux;
                       }
                       
                       NSMutableString *vars = [NSMutableString string];
                       [vars appendString:@"item_location="];
                       [vars appendFormat:@"lat:%@_%@", @(minlat), @(maxlat)];
                       [vars appendFormat:@",lon:%@_%@", @(minlon), @(maxlon)];
                       
                       [[[CLGeocoder alloc] init] reverseGeocodeLocation:itemlocation completionHandler:
                        ^(NSArray<CLPlacemark*>* _Nullable placemarks, NSError* _Nullable error)
                        {
                            mcountryitem *country;
                            
                            if(!error && placemarks && placemarks.count)
                            {
                                CLPlacemark *mark = placemarks[0];
                                NSString *countryname = mark.addressDictionary[(NSString*)kABPersonAddressCountryKey];
                                country = [[mcountry singleton] countryforname:countryname.lowercaseString];
                            }
                            
                            if(!country)
                            {
                                country = [[mcountry singleton] countrydefault];
                            }
                            
                            dispatch_async(dispatch_get_main_queue(),
                                           ^
                                           {
                                               [[analytics singleton] trackevent:ga_event_location action:ga_action_map label:nil];
                                               
                                               [[msettings singleton] changecountry:country location:vars locationname:NSLocalizedString(@"config_location_mapselected", nil)];
                                               [[cmain singleton] popViewControllerAnimated:YES];
                                           });
                        }];
                   });
}

-(void)actionuser:(UIButton*)button
{
    [self.map centeruser];
}

#pragma mark public

-(void)showbuttonuser
{
    [self.btnuser setHidden:NO];
}

@end