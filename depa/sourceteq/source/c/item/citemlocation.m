#import "citemlocation.h"

@class mitemdetail;

@implementation citemlocation

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

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [(vitemlocation*)self.view loadmap];
}

-(void)loadView
{
    self.view = [[vitemlocation alloc] init:self];
    self.viewlocation = (vitemlocation*)self.view;
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