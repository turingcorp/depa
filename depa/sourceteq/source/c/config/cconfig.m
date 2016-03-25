#import "cconfig.h"

@interface cconfig ()

@property(strong, nonatomic)vconfig *view;

@end

@implementation cconfig

@dynamic view;

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view didappear];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_config];
}

-(void)loadView
{
    self.view = [[vconfig alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end