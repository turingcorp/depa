#import "vlikedbutton.h"

@implementation vlikedbutton
{
    UIColor *color;
}

-(instancetype)init:(cpages*)pages
{
    self = [super initWithFrame:CGRectMake(0, 0, 80, 40)];
    [self setClipsToBounds:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self addTarget:pages action:@selector(openfavorites) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setImage:[[UIImage imageNamed:@"liked"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    vbadge *badge = [[vbadge alloc] init];
    self.badge = badge;
    
    [self addSubview:image];
    [self addSubview:badge];
    
    NSDictionary *views = @{@"image":image, @"badge":badge};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[image]-(-16)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[badge(28)]-6-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[badge(28)]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedbadgechanged:) name:notbadgechange object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedbadgechanged:) name:notitemsloaded object:nil];
    [self badgeupdate];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark notified

-(void)notifiedbadgechanged:(NSNotification*)notification
{
    [self badgeupdate];
}

#pragma mark functionality

-(void)badgeupdate
{
    __weak typeof(self) weakself = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSNumber *numnews = [mdb newitems];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          if(numnews.integerValue)
                                          {
                                              color = colorsecond;
                                              [self.badge setHidden:NO];
                                              [self.badge.label setText:[NSString stringWithFormat:@"%@", numnews]];
                                          }
                                          else
                                          {
                                              [self.badge setHidden:YES];
                                              color = [UIColor whiteColor];
                                          }
                                          
                                          [weakself hover];
                                      });
                   });
    
    [self hover];
}

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.image setTintColor:[color colorWithAlphaComponent:0.2]];
    }
    else
    {
        [self.image setTintColor:color];
    }
}

@end