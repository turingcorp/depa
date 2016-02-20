#import "vplayitem.h"

@implementation vplayitem

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];

    self.model = model;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    self.image = image;
    
    UILabel *labelprice = [[UILabel alloc] init];
    [labelprice setBackgroundColor:[UIColor clearColor]];
    [labelprice setUserInteractionEnabled:NO];
    [labelprice setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelprice setFont:[UIFont fontWithName:fontboldname size:16]];
    [labelprice setTextColor:[UIColor blackColor]];
    [labelprice setText:[[tools singleton] pricetostring:controller.item.itemprice]];
    
    UIView *pricebase = [[UIView alloc] init];
    [pricebase setUserInteractionEnabled:NO];
    [pricebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    [pricebase setBackgroundColor:[UIColor whiteColor]];
    [pricebase setClipsToBounds:YES];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setFont:[UIFont fontWithName:fontname size:16]];
    [labeltitle setText:controller.item.itemtitle];
    [labeltitle setTextColor:[UIColor blackColor]];
    
    UIView *titlebase = [[UIView alloc] init];
    [titlebase setUserInteractionEnabled:NO];
    [titlebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titlebase setBackgroundColor:[UIColor whiteColor]];
    [titlebase setClipsToBounds:YES];
    
    [pricebase addSubview:labelprice];
    [titlebase addSubview:labeltitle];
    [self addSubview:image];
    [self addSubview:titlebase];
    [self addSubview:pricebase];
    
    NSDictionary *views = @{@"image":image, @"labeltitle":labeltitle, @"titlebase":titlebase, @"pricebase":pricebase, @"labelprice":labelprice};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-5-[pricebase(40)]-5-[titlebase(60)]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[labeltitle]-15-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[labeltitle]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[titlebase]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[labelprice]-15-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelprice]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[pricebase]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedimage:) name:notimageloaded object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedimage:(NSNotification*)notification
{
    aimateqitem *apiimage = self.controlleritem.item.apiimage;
    
    if([apiimage equalsnotification:notification])
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.image setImage:apiimage.image];
                       });
    }
}

@end