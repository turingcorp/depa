#import "vitemcarcel.h"

@implementation vitemcarcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setUserInteractionEnabled:NO];
    self.image = image;
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedimage:) name:notimageloaded object:nil];
    
    return self;
}

#pragma mark notified

-(void)notifiedimage:(NSNotification*)notification
{
    if([self.apiimage equalsnotification:notification])
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
    if(self.apiimage.image)
    {
        [self.image setImage:self.apiimage.image];
        
        [UIView animateWithDuration:0.6 animations:
         ^
         {
             [self.image setAlpha:1];
         }];
    }
}

#pragma mark public

-(void)config:(aimateqitem*)apiimage
{
    self.apiimage = apiimage;
    [self refreshimage];
}

@end