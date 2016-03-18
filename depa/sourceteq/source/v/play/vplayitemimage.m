#import "vplayitemimage.h"

@implementation vplayitemimage

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    self.model = model;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setUserInteractionEnabled:NO];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setClipsToBounds:YES];
    [image.layer setBorderWidth:1];
    [image.layer setBorderColor:[UIColor blackColor].CGColor];
    [image.layer setCornerRadius:4];
    self.image = image;
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-18-[image]-18-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-17-[image]-(-10)-|" options:0 metrics:metrics views:views]];
    
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

@end