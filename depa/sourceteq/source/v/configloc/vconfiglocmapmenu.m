#import "vconfiglocmapmenu.h"

@implementation vconfiglocmapmenu

-(instancetype)init:(vconfiglocmap*)map
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.map = map;
    vblur *blur = [vblur light:NO];
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *btnaccept = [[UIButton alloc] init];
    [btnaccept setClipsToBounds:YES];
    [btnaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnaccept setImage:[[UIImage imageNamed:@"accept"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btnaccept setImage:[[UIImage imageNamed:@"accept"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [btnaccept.imageView setTintColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [btnaccept.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btnaccept.imageView setClipsToBounds:YES];
    [btnaccept addTarget:self action:@selector(actionaccept:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnuser = [[UIButton alloc] init];
    [btnuser setClipsToBounds:YES];
    [btnuser setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnuser setImage:[[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [btnuser setImage:[[UIImage imageNamed:@"user"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [btnuser.imageView setTintColor:[UIColor colorWithWhite:0 alpha:1]];
    [btnuser.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [btnuser.imageView setClipsToBounds:YES];
    [btnuser setHidden:YES];
    [btnuser addTarget:self action:@selector(actionuser:) forControlEvents:UIControlEventTouchUpInside];
    self.btnuser = btnuser;
    
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:btnaccept];
    [self addSubview:btnuser];
    
    NSDictionary *views = @{@"blur":blur, @"accept":btnaccept, @"user":btnuser, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[user(90)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[accept(90)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[user]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[accept]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionaccept:(UIButton*)button
{
    [self.map setUserInteractionEnabled:NO];
    
    vconfiglocmapview *map = self.map.map;
    vconfiglocmapann *ann = (vconfiglocmapann*)[map viewForAnnotation:map.annotation];
    
    CGPoint point1 = ann.point.frame.origin;
    CGPoint point2 = CGPointMake(CGRectGetMaxX(ann.point.frame), CGRectGetMaxY(ann.point.frame));
    
    CGPoint point1x = [map convertPoint:point1 fromView:ann];
    CGPoint point2x = [map convertPoint:point2 fromView:ann];
    CLLocationCoordinate2D locmin = [map pointtocoord:point1x];
    CLLocationCoordinate2D locmax = [map pointtocoord:point2x];
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
    
    [[msettings singleton] changecountry:[msettings singleton].country location:vars locationname:NSLocalizedString(@"config_location_mapselected", nil)];
    [[cmain singleton] popViewControllerAnimated:YES];
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