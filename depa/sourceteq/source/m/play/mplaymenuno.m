#import "mplaymenuno.h"

@implementation mplaymenuno

#pragma mark -
#pragma mark play protocol

-(NSString*)assetname
{
    NSString *name = @"no";
    
    return name;
}

-(UIColor*)tintcolor
{
    UIColor *color = [UIColor colorWithRed:1 green:0.33 blue:0 alpha:1];
    
    return color;
}

-(void)action:(cplayitem*)controller
{
    vplay *view = (vplay*)controller.view;
    vplayitemimage *itemimage = view.item.image;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setUserInteractionEnabled:NO];
    [image setImage:[[UIImage imageNamed:[self assetname]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTintColor:[self tintcolor]];
    [image setAlpha:0];
    
    [itemimage addSubview:image];
    
    CGFloat imageheight = 140;
    CGFloat itemheight = itemimage.bounds.size.height;
    CGFloat imagemargin = (itemheight - imageheight) / 2.0;
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{@"height":@(imageheight), @"margin":@(imagemargin)};
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[image(height)]" options:0 metrics:metrics views:views]];
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [image setAlpha:1];
         [itemimage.image setAlpha:0.3];
     } completion:
     ^(BOOL done)
     {
         [controller.play playno];
     }];
}

@end