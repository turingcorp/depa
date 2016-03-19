#import "vplayitemimage.h"

@implementation vplayitemimage

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setBackgroundColor:colormain];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    UIView *overview = [[UIView alloc] init];
    [overview setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [overview setUserInteractionEnabled:NO];
    [overview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.model = model;
    UIImageView *image = [[UIImageView alloc] init];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setClipsToBounds:YES];
    self.image = image;
    
    [self addSubview:overview];
    [self addSubview:image];
    [self addSubview:border];
    
    NSDictionary *views = @{@"image":image, @"over":overview, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[over]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[over]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[image]-0-|" options:0 metrics:metrics views:views]];
    
    [self refreshimage];
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
    if([self.model.apiimage equalsnotification:notification])
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self refreshimage];
                       });
    }
}

#pragma mark functionality

-(void)refreshimage
{
    [self.image setImage:self.model.apiimage.image];
}

#pragma mark public

-(void)like
{
    [self addSubview:[[vplayitemimagelike alloc] initWithFrame:self.bounds]];
}

-(void)no
{
    
}

@end