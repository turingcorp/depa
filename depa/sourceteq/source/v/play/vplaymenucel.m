#import "vplaymenucel.h"

@implementation vplaymenucel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    UIImageView *image = [[UIImageView alloc] init];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    NSDictionary *views
    
    return self;
}

#pragma mark public

-(void)config:(id<mplaymenuprotocol>)model
{
    [self.image setImage:[model assetname]];
}

@end