#import "mplaymenulike.h"

@implementation mplaymenulike

#pragma mark -
#pragma mark play protocol

-(NSString*)assetname
{
    NSString *name = @"like";
    
    return name;
}

-(UIColor*)tintcolor
{
    UIColor *color = [UIColor colorWithRed:0.4 green:0.7 blue:0.8 alpha:1];
    
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
    
    NSLayoutConstraint *constr = [NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:itemimage attribute:NSLayoutAttributeBottom multiplier:1 constant:imagemargin];
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[image(height)]" options:0 metrics:metrics views:views]];
    [view addConstraint:constr];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 10), dispatch_get_main_queue(),
                   ^
                   {
                       constr.constant = -imagemargin;
                       
                       [UIView animateWithDuration:0.4 animations:
                        ^
                        {
                            [image setAlpha:1];
                            [itemimage layoutIfNeeded];
                        } completion:
                        ^(BOOL done)
                        {
                            [controller.play playlike];
                        }];
                   });
    
    [UIView animateWithDuration:0.9 animations:
     ^
     {
         [itemimage.image setAlpha:0];
     }];
}

@end