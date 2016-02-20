#import "vplayitem.h"

@implementation vplayitem

-(instancetype)init:(cplayitem*)controller
{
    self = [super init:controller];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];

    self.controlleritem = controller;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    self.image = image;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    [label setText:controller.item.itemtitle];
    [label setTextColor:[UIColor blackColor]];
    
    UIView *titlebase = [[UIView alloc] init];
    [titlebase setUserInteractionEnabled:NO];
    [titlebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titlebase setBackgroundColor:[UIColor whiteColor]];
    [titlebase setClipsToBounds:YES];
    
    [titlebase addSubview:label];
    [self addSubview:image];
    [self addSubview:titlebase];
    
    NSDictionary *views = @{@"image":image, @"label":label, @"titlebase":titlebase};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-70-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[label]-15-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[titlebase]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titlebase(60)]-5-|" options:0 metrics:metrics views:views]];
    
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