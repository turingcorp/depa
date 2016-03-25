#import "vlikedcel.h"

@implementation vlikedcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *basegeneral = [[UIView alloc] init];
    [basegeneral setClipsToBounds:YES];
    [basegeneral setUserInteractionEnabled:NO];
    [basegeneral setTranslatesAutoresizingMaskIntoConstraints:NO];
    [basegeneral.layer setCornerRadius:5];
    self.basegeneral = basegeneral;
    
    UIView *baseimage = [[UIView alloc] init];
    [baseimage setClipsToBounds:YES];
    [baseimage setUserInteractionEnabled:NO];
    [baseimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [baseimage setBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    self.baseimage = baseimage;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    self.label = label;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    self.image = image;
    
    [baseimage addSubview:image];
    [basegeneral addSubview:baseimage];
    
    [self addSubview:basegeneral];
    [self addSubview:label];
    
    NSDictionary *views = @{@"basegeneral":basegeneral, @"label":label, @"base":baseimage, @"image":image};
    NSDictionary *metrics = @{@"imageheight":@(vlikedcellimageheight), @"spacing":@(vlikedcellspacing), @"hrpadding":@(vlikedcellhrpadding), @"bottompadding":@(vlikedcellbottompadding)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[basegeneral]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[basegeneral]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[base]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[base(imageheight)]-(spacing)-[label]-(bottompadding)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hrpadding)-[label]-(hrpadding)-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedimage:) name:notimageloaded object:nil];
    
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

-(void)notifiedimage:(NSNotification*)notification
{
    if([self.item.apiimage equalsnotification:notification])
    {
        __weak typeof(self) weakself = self;
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [weakself refreshimage];
                       });
    }
}

#pragma mark functionality

-(void)refreshimage
{
    if(self.item.apiimage)
    {
        if(self.item.apiimage.image)
        {
            [self.image setImage:self.item.apiimage.image];
            
            [UIView animateWithDuration:0.6 animations:
             ^
             {
                 [self.image setAlpha:1];
             }];
        }
    }
    else
    {
        self.item.apiimage = [[aimateqitem alloc] init:self.item.thumbnail];
    }
}

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.baseimage setAlpha:0.3];
        [self.basegeneral setBackgroundColor:[UIColor colorWithWhite:0.6 alpha:1]];
        [self.label setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self.baseimage setAlpha:1];
        [self.basegeneral setBackgroundColor:[UIColor whiteColor]];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    }
}

#pragma mark public

-(void)config:(mlikeditem*)item
{
    self.item = item;
    self.image.image = nil;
    [self.image setAlpha:0];
    [self.label setAttributedText:item.display];
    [self hover];
    [self refreshimage];
}

@end