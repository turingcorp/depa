#import "citemlocation.h"

@class mitemdetail;

@implementation citemlocation

@dynamic view;

+(void)show:(mitemdetail*)item
{
    citemlocation *controller = [[citemlocation alloc] init:item];
    [[cmain singleton] presentViewController:controller animated:YES completion:nil];
}

-(instancetype)init:(mitemdetail*)item
{
    self = [super init];
    
    self.item = item;
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view loadmap];
    [[analytics singleton] trackscreen:ga_screen_detail_location];
}

-(void)loadView
{
    self.view = [[vitemlocation alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark public

-(void)back
{
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

@end
